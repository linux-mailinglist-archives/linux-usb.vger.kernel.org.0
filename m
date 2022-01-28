Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83CD49F6EE
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jan 2022 11:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243320AbiA1KPD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 28 Jan 2022 05:15:03 -0500
Received: from mx-relay97-hz1.antispameurope.com ([94.100.132.94]:54691 "EHLO
        mx-relay97-hz1.antispameurope.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231378AbiA1KPD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jan 2022 05:15:03 -0500
X-Greylist: delayed 331 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Jan 2022 05:15:02 EST
Received: from unknown ([185.80.187.2]) by mx-relay97-hz1.antispameurope.com;
 Fri, 28 Jan 2022 11:09:30 +0100
Received: from grp-ex01.Vivavis.int (192.168.17.53) by grp-ex01.Vivavis.int
 (192.168.17.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 28 Jan
 2022 11:09:26 +0100
Received: from grp-ex01.Vivavis.int ([::1]) by grp-ex01.Vivavis.int ([::1])
 with mapi id 15.02.0986.015; Fri, 28 Jan 2022 11:09:26 +0100
From:   "embedded (VIVAVIS AG)" <embedded@vivavis.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: AW: ftdi_sio: Problem when changing the baud rate after a transfer
Thread-Topic: ftdi_sio: Problem when changing the baud rate after a transfer
Thread-Index: AdgGJbRPj9Lxv6TJRBW2/KYX/66liQN/alhw
Date:   Fri, 28 Jan 2022 10:09:26 +0000
Message-ID: <1ec54d4f592c46b7a14109df559072e4@vivavis.com>
References: <5aae37a8029549d8a9ef28f2e39fe58f@vivavis.com>
In-Reply-To: <5aae37a8029549d8a9ef28f2e39fe58f@vivavis.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.1]
x-g-data-mailsecurity-for-exchange-state: 0
x-g-data-mailsecurity-for-exchange-error: 0
x-g-data-mailsecurity-for-exchange-sender: 23
x-g-data-mailsecurity-for-exchange-server: 61419075-592b-4c8d-b7a0-bf1d145a8b8e
x-c2processedorg: 2f045ba3-9b34-4118-a5bd-6c10d5957477
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-cloud-security-sender: embedded@vivavis.com
X-cloud-security-recipient: linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay97-hz1.antispameurope.com with B8D9EDE6D96
X-cloud-security-connect: unknown[185.80.187.2], TLS=1, IP=185.80.187.2
X-cloud-security-Digest: b5cad2cde68c0d9b714a2c82db707d28
X-cloud-security: scantime:1.698
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Gesendet: Montag, 10. Januar 2022 14:27
> An: linux-usb@vger.kernel.org
> Betreff: ftdi_sio: Problem when changing the baud rate after a transfer
>
> Hi,
> there seems to be a problem with the ftdi_sio driver in conjunction with an FT2232C and changing the baud rate.
> This behavior is observable at least on linux 4.19.190.
> The following was done in order to observe this problem:
> A transfer is started over one of the serial interfaces of the FT2232C at a lower baud rate, eg. 300 baud.
> The code waits for the driver to empty the tx buffer by calling tcdrain(). After the call returns the code changes
> the baud rate of the serial interface to a higher rate, eg. 4800 baud, and writes another stream of bytes.
> Now the problem occurs: Looking at the TX pin of the used interface with an oscilloscope, one can see that
> the last byte of the previous transfer, which is supposed to be transferred at 300 baud, is transferred at the
> higher rate of 4800 baud. Even worse, it is not even the complete byte, but rather some of the last bits of
> that last byte which are transferred at the new baud rate configured. This problem occurs independent of
> whether the interface is opened in blocking or non-blocking mode.
> I verified that the driver does in fact ask the hardware if it's tx buffer is empty when the hardware status is
> reported. However, it seems that the reported status by the FT2232C does not check the status of it's shift
> register (if that is even possible at all), which is clearly influenced by the changed baud rate.
>
> Can someone confirm this behavior and is there a proper way to fix it?
>
> Regards,
> Yasin Morsli
>
>
> PS: Here is an MWE to test this behavior:
>
> #include <stdio.h>
> #include <fcntl.h>
> #include <string.h>
> #include <termios.h>
>
> const char* help_msg =
>    "Usage: %s [tty] [data]\n"
>    "  tty:  filepath to the tty\n"
>    "  data: data to transfer\n";
>
> int error(const char* msg) {
>    printf("Error: %s\n", msg);
>    return -1;
>}
>
>int setspeed(int fd_tty, int speed) {
>   struct termios tty;
>    if (tcgetattr(fd_tty, &tty) != 0) return error("tcgetattr failed");
>
>    cfsetospeed(&tty, speed);
>    cfsetispeed(&tty, speed);
>
>    if (tcsetattr(fd_tty, TCSANOW, &tty) != 0) return error("tcsetattr failed");
>
>    return 0;
>}
>
>int main(int argc, const char** argv) {
>    if (argc < 3) {
>        printf(help_msg, argv[0]);
>        return 0;
>    }
>
>    const char* path_tty = argv[1];
>    const char* data_tty = argv[2];
>
>    int fd_tty = open(path_tty, O_RDWR | O_NOCTTY);
>    if (fd_tty < 0) return error("open failed");
>
>    struct termios tty;
>    if (tcgetattr(fd_tty, &tty) != 0) return error("tcgetattr failed");
>
>    tty.c_cflag &= ~(CSIZE  | PARENB | CRTSCTS);
>    tty.c_cflag |=  (CS7 | CSTOPB);
>    tty.c_iflag &= ~(IXON | IXOFF | IXANY | IGNBRK);
>    tty.c_lflag = 0;
>    tty.c_oflag = 0;
>    tty.c_cc[VMIN] = 0;
>
>    if (tcsetattr(fd_tty, TCSANOW, &tty) != 0) return error("tcsetattr failed");
>
>    if (setspeed(fd_tty, B300) != 0) return error("setspeed failed");
>    write(fd_tty, data_tty, strlen(data_tty));
>    tcdrain(fd_tty);
>
>    if (setspeed(fd_tty, B4800) != 0) return error("setspeed failed");
>    write(fd_tty, data_tty, strlen(data_tty));
>    tcdrain(fd_tty);
>
>    close(fd_tty);
>
>    return 0;
>}

I've found this older thread https://www.spinics.net/lists/linux-usb/msg71689.html.
The proposed solution or patch with chars_in_buffer() function doesn't exist in more recent
kernels (4.19 or newer), but the same functionality is achieved by ftdi_tx_empty(), which is
indeed called, when tcdrain() is called from userspace.
ftdi_tx_empty() calls ftdi_get_modem_status() and checks whether FTDI_RS_TEMPT flag is
set. If set (i.e. shift register empty) ftdi_tx_empty() returns true.

But I wonder why FTDI_RS_THRE (transmit holding register empty) is not taken into account.
Furthermore, I can not find any checks for tx-fifos. But possibly the FTDI chip has a guarantee
that if FTDI_RS_TEMPT is set, the holding register and internal tx-fifos are empty, too.

As Yasin stated above, it can be observed that the chip transmits data, even if the driver reports
ftdi_tx_empty() == true. Possibly due to a bug in the driver or by poor chip design.

Any thoughts on this?

Carsten

