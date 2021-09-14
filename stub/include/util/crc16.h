/**
 * @file crc16.h
 * @brief Contains the serial port interface
 * @author Johannes Huebner <dev@johanneshuebner.com>
 * @date 06.04.2016
 */
#ifndef CRC16_H_
#define CRC16_H_
#include <stdint.h>

uint16_t _crc_xmodem_update(uint16_t __crc, uint8_t __data);

#endif /* CRC16_H_ */
