Return-Path: <linux-usb+bounces-11441-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB78690EF13
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 15:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9114528772C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 13:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340C2149C43;
	Wed, 19 Jun 2024 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aparcar.org header.i=@aparcar.org header.b="FaW3hBpF"
X-Original-To: linux-usb@vger.kernel.org
Received: from st43p00im-ztfb10061701.me.com (st43p00im-ztfb10061701.me.com [17.58.63.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C7A147C7B
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.63.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718804118; cv=none; b=aixUuT/kr1lDrblbfeACUAzX3uCn3gZJ4SToo2e1K5U6Dy/FWJJ5Y+7cy3jTaXhLo/y0YOOBAWsAHsh/AcJLKuHxrB/tkg8KRmxJVeVbEyid2aHvZbmOJ/A6iZbR8gOMWhqkKis2mohNaqNlJqkHaXWBeIJB4YZ62lSPPwevmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718804118; c=relaxed/simple;
	bh=n07Oc2tc9YWNVBf2k12HVN5GNo2Py4b5vMo7r86vTg8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Egnk/KqY7wFH9ssne/yex0a8zW8lBOsx5TCPB/IWvOvyPwnm/k0yjdTSvPTpKTG8RI77lKZnb6FkzlI448ew2CTGV6qW2p5U97sMSw100ykxItbO6ErK0Q0lL8qnyvzWWVtoP7nw9WJfGWp6+fBD10dhnhX6TL8YEUq+kK9XMgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aparcar.org; spf=pass smtp.mailfrom=aparcar.org; dkim=pass (2048-bit key) header.d=aparcar.org header.i=@aparcar.org header.b=FaW3hBpF; arc=none smtp.client-ip=17.58.63.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aparcar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aparcar.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aparcar.org; s=sig1;
	t=1718804114; bh=SnBE2phgSKvYojZgp9V4WMem4QEOvCRi1IIhMzSCO7s=;
	h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
	b=FaW3hBpFo6WpR7iEatkWMVQ3iX+YkEmAoHsm+mTNjzA3k918ceprAXzCef9wNlQ38
	 pQo7XoDKUHg9bymK+QEUTxbDIABq9jNYL5pWBAZjov5gJrF1+2lrSF2PxkHcyXj9JW
	 6xxe1rrHjXX53cR9laarjJY5FlZJJbhqbwqnlGaOwG72iuX+BLwH5HtiAmYSGMEoPd
	 MZ1QR40BvM0ZCuvrgqpaB9Bw86hL11dI81kBhak9wgUSErkBHn2h/T2fQEwriY0V2g
	 yeXcU8RP08GVODkhsaOmrXCiSrnmmRoarFPOd8B6/NurgF6HN92/TqrkUhs1koDanG
	 FctiC+TPQd81Q==
Received: from smtpclient.apple (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
	by st43p00im-ztfb10061701.me.com (Postfix) with ESMTPSA id 21E223801AB;
	Wed, 19 Jun 2024 13:35:11 +0000 (UTC)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_34D60EC5-E2AF-439D-AF6D-576764633EEB";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 1/1 v7] usb: serial: add support for CH348
From: Paul Spooren <mail@aparcar.org>
In-Reply-To: <20240507131522.3546113-2-clabbe@baylibre.com>
Date: Wed, 19 Jun 2024 15:34:59 +0200
Cc: gregkh@linuxfoundation.org,
 johan@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org,
 martin.blumenstingl@googlemail.com,
 david@ixit.cz
Message-Id: <A4B2BDF4-263F-4879-A0C3-399D8A1BF3FE@aparcar.org>
References: <20240507131522.3546113-1-clabbe@baylibre.com>
 <20240507131522.3546113-2-clabbe@baylibre.com>
To: Corentin Labbe <clabbe@baylibre.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-Proofpoint-ORIG-GUID: So4SmRQLJr6eTiM-yPM8QGdSB68wDbYc
X-Proofpoint-GUID: So4SmRQLJr6eTiM-yPM8QGdSB68wDbYc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 clxscore=1030
 suspectscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2406130160


--Apple-Mail=_34D60EC5-E2AF-439D-AF6D-576764633EEB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 7. May 2024, at 15:15, Corentin Labbe <clabbe@baylibre.com> wrote:
>=20
> The CH348 is an USB octo port serial adapter.
> The device multiplexes all 8 ports in the same pair of Bulk endpoints.
> Since there is no public datasheet, unfortunately it remains some =
magic values
>=20
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Tested-by: Paul Spooren <mail@aparcar.org <mailto:mail@aparcar.org>>
(On BananaPi R3 running OpenWrt with YR-6008 module)

Patch is already being backported here =
https://github.com/openwrt/openwrt/pull/15733

> ---
> drivers/usb/serial/Kconfig  |   9 +
> drivers/usb/serial/Makefile |   1 +
> drivers/usb/serial/ch348.c  | 725 ++++++++++++++++++++++++++++++++++++
> 3 files changed, 735 insertions(+)
> create mode 100644 drivers/usb/serial/ch348.c
>=20
> diff --git a/drivers/usb/serial/Kconfig b/drivers/usb/serial/Kconfig
> index ef8d1c73c754..1e1842656b54 100644
> --- a/drivers/usb/serial/Kconfig
> +++ b/drivers/usb/serial/Kconfig
> @@ -112,6 +112,15 @@ config USB_SERIAL_CH341
>  To compile this driver as a module, choose M here: the
>  module will be called ch341.
>=20
> +config USB_SERIAL_CH348
> + tristate "USB Winchiphead CH348 Octo Port Serial Driver"
> + help
> +  Say Y here if you want to use a Winchiphead CH348 octo port
> +  USB to serial adapter.
> +
> +  To compile this driver as a module, choose M here: the
> +  module will be called ch348.
> +
> config USB_SERIAL_WHITEHEAT
> tristate "USB ConnectTech WhiteHEAT Serial Driver"
> select USB_EZUSB_FX2
> diff --git a/drivers/usb/serial/Makefile b/drivers/usb/serial/Makefile
> index c7bb1a88173e..d16ff59fde68 100644
> --- a/drivers/usb/serial/Makefile
> +++ b/drivers/usb/serial/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_USB_SERIAL_AIRCABLE) +=3D aircable.o
> obj-$(CONFIG_USB_SERIAL_ARK3116) +=3D ark3116.o
> obj-$(CONFIG_USB_SERIAL_BELKIN) +=3D belkin_sa.o
> obj-$(CONFIG_USB_SERIAL_CH341) +=3D ch341.o
> +obj-$(CONFIG_USB_SERIAL_CH348) +=3D ch348.o
> obj-$(CONFIG_USB_SERIAL_CP210X) +=3D cp210x.o
> obj-$(CONFIG_USB_SERIAL_CYBERJACK) +=3D cyberjack.o
> obj-$(CONFIG_USB_SERIAL_CYPRESS_M8) +=3D cypress_m8.o
> diff --git a/drivers/usb/serial/ch348.c b/drivers/usb/serial/ch348.c
> new file mode 100644
> index 000000000000..e437ba36bb5e
> --- /dev/null
> +++ b/drivers/usb/serial/ch348.c
> @@ -0,0 +1,725 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * USB serial driver for USB to Octal UARTs chip ch348.
> + *
> + * Copyright (C) 2022 Corentin Labbe <clabbe@baylibre.com>
> + * With the help of Neil Armstrong <neil.armstrong@linaro.org>
> + * and the help of Martin Blumenstingl =
<martin.blumenstingl@googlemail.com>
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
> +#include <linux/serial.h>
> +#include <linux/slab.h>
> +#include <linux/tty.h>
> +#include <linux/tty_driver.h>
> +#include <linux/tty_flip.h>
> +#include <linux/usb.h>
> +#include <linux/usb/serial.h>
> +
> +#define CH348_CMD_TIMEOUT   2000
> +
> +#define CH348_CTO_D 0x01
> +#define CH348_CTO_R 0x02
> +
> +#define CH348_CTI_C 0x10
> +#define CH348_CTI_DSR 0x20
> +#define CH348_CTI_R 0x40
> +#define CH348_CTI_DCD 0x80
> +
> +#define CH348_LO 0x02
> +#define CH348_LP 0x04
> +#define CH348_LF 0x08
> +#define CH348_LB 0x10
> +
> +#define CMD_W_R 0xC0
> +#define CMD_W_BR 0x80
> +
> +#define CMD_WB_E 0x90
> +#define CMD_RB_E 0xC0
> +
> +#define M_NOR 0x00
> +#define M_HF 0x03
> +
> +#define R_MOD 0x97
> +#define R_IO_D 0x98
> +#define R_IO_O 0x99
> +#define R_IO_I 0x9b
> +#define R_TM_O 0x9c
> +#define R_INIT 0xa1
> +
> +#define R_C1 0x01
> +#define R_C2 0x02
> +#define R_C4 0x04
> +#define R_C5 0x06
> +
> +#define R_II_B1 0x06
> +#define R_II_B2 0x02
> +#define R_II_B3 0x00
> +
> +#define CMD_VER 0x96
> +
> +#define CH348_RX_PORT_CHUNK_LENGTH 32
> +#define CH348_RX_PORT_MAX_LENGTH 30
> +
> +struct ch348_rxbuf {
> + u8 port;
> + u8 length;
> + u8 data[CH348_RX_PORT_MAX_LENGTH];
> +} __packed;
> +
> +struct ch348_txbuf {
> + u8 port;
> + __le16 length;
> + u8 data[];
> +} __packed;
> +
> +#define CH348_TX_HDRSIZE offsetof(struct ch348_txbuf, data)
> +
> +struct ch348_initbuf {
> + u8 cmd;
> + u8 reg;
> + u8 port;
> + __be32 baudrate;
> + u8 format;
> + u8 paritytype;
> + u8 databits;
> + u8 rate;
> + u8 unknown;
> +} __packed;
> +
> +#define CH348_MAXPORT 8
> +
> +/*
> + * The CH348 multiplexes rx & tx into a pair of Bulk USB endpoints =
for
> + * the 8 serial ports, and another pair of Bulk USB endpoints to
> + * set port settings and receive port status events.
> + *
> + * The USB serial cores ties every Bulk endpoints pairs to each =
ports,
> + * but in our case it will set port 0 with the rx/tx endpoints
> + * and port 1 with the setup/status endpoints.
> + *
> + * To still take advantage of the generic code, we (re-)initialize
> + * the USB serial port structure with the correct USB endpoint
> + * for read and write, and write proper process_read_urb()
> + * and prepare_write_buffer() to correctly (de-)multiplex data.
> + * Also we use a custom write() implementation to wait until the =
buffer
> + * has been fully transmitted to prevent TX buffer overruns.
> + */
> +
> +/*
> + * struct ch348_port - per-port information
> + * @uartmode: UART port current mode
> + * @write_completion: completion event when the TX buffer has been =
written out
> + */
> +struct ch348_port {
> + u8 uartmode;
> + struct completion write_completion;
> +};
> +
> +/*
> + * struct ch348 - main container for all this driver information
> + * @udev: pointer to the CH348 USB device
> + * @ports: List of per-port information
> + * @serial: pointer to the serial structure
> + * @write_lock: protect against concurrent writes so we don't lose =
data
> + * @cmd_ep: endpoint number for configure operations
> + * @status_urb: URB for status
> + * @status_buffer: buffer used by status_urb
> + */
> +struct ch348 {
> + struct usb_device *udev;
> + struct ch348_port ports[CH348_MAXPORT];
> + struct usb_serial *serial;
> +
> + struct mutex write_lock;
> +
> + int cmd_ep;
> +
> + struct urb *status_urb;
> + u8 status_buffer[];
> +};
> +
> +struct ch348_magic {
> + u8 action;
> + u8 reg;
> + u8 control;
> +} __packed;
> +
> +struct ch348_status_entry {
> + u8 portnum:4;
> + u8 unused:4;
> + u8 reg_iir;
> + union {
> + u8 lsr_signal;
> + u8 modem_signal;
> + u8 init_data[10];
> + };
> +} __packed;
> +
> +static void ch348_process_status_urb(struct urb *urb)
> +{
> + struct ch348_status_entry *status_entry;
> + struct ch348 *ch348 =3D urb->context;
> + int ret, status =3D urb->status;
> + struct usb_serial_port *port;
> + unsigned int i, status_len;
> +
> + switch (status) {
> + case 0:
> + /* success */
> + break;
> + case -ECONNRESET:
> + case -ENOENT:
> + case -ESHUTDOWN:
> + /* this urb is terminated, clean up */
> + dev_dbg(&urb->dev->dev, "%s - urb shutting down with status: %d\n",
> + __func__, status);
> + return;
> + default:
> + dev_err(&urb->dev->dev, "%s - nonzero urb status received: %d\n",
> + __func__, status);
> + goto exit;
> + }
> +
> + if (urb->actual_length < 3) {
> + dev_warn(&ch348->udev->dev,
> + "Received too short status buffer with %u bytes\n",
> + urb->actual_length);
> + goto exit;
> + }
> +
> + for (i =3D 0; i < urb->actual_length;) {
> + status_entry =3D urb->transfer_buffer + i;
> +
> + if (status_entry->portnum >=3D CH348_MAXPORT) {
> + dev_warn(&ch348->udev->dev,
> + "Invalid port %d in status entry\n",
> + status_entry->portnum);
> + break;
> + }
> +
> + port =3D ch348->serial->port[status_entry->portnum];
> + status_len =3D 3;
> +
> + if (!status_entry->reg_iir) {
> + dev_dbg(&port->dev, "Ignoring status with zero reg_iir\n");
> + } else if (status_entry->reg_iir =3D=3D R_INIT) {
> + status_len =3D 12;
> + } else if ((status_entry->reg_iir & 0x0f) =3D=3D R_II_B1) {
> + if (status_entry->lsr_signal & CH348_LO)
> + port->icount.overrun++;
> + if (status_entry->lsr_signal & CH348_LP)
> + port->icount.parity++;
> + if (status_entry->lsr_signal & CH348_LF)
> + port->icount.frame++;
> + if (status_entry->lsr_signal & CH348_LF)
> + port->icount.brk++;
> + } else if ((status_entry->reg_iir & 0x0f) =3D=3D R_II_B2) {
> + complete_all(&ch348->ports[status_entry->portnum].write_completion);
> + } else {
> + dev_warn(&port->dev,
> + "Unsupported status with reg_iir 0x%02x\n",
> + status_entry->reg_iir);
> + }
> +
> + usb_serial_debug_data(&port->dev, __func__, status_len,
> +      urb->transfer_buffer + i);
> +
> + i +=3D status_len;
> + }
> +
> +exit:
> + ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> + if (ret)
> + dev_err(&urb->dev->dev, "%s - usb_submit_urb failed; %d\n",
> + __func__, ret);
> +}
> +
> +/*
> + * Some values came from vendor tree, and we have no meaning for =
them, this
> + * function simply use them.
> + */
> +static int ch348_do_magic(struct ch348 *ch348, int portnum, u8 =
action, u8 reg, u8 control)
> +{
> + struct ch348_magic *buffer;
> + int ret, len;
> +
> + buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> + if (!buffer)
> + return -ENOMEM;
> +
> + if (portnum < 4)
> + reg +=3D 0x10 * portnum;
> + else
> + reg +=3D 0x10 * (portnum - 4) + 0x08;
> +
> + buffer->action =3D action;
> + buffer->reg =3D reg;
> + buffer->control =3D control;
> +
> + ret =3D usb_bulk_msg(ch348->udev, ch348->cmd_ep, buffer, 3, &len,
> +   CH348_CMD_TIMEOUT);
> + if (ret)
> + dev_err(&ch348->udev->dev, "Failed to write magic err=3D%d\n", ret);
> +
> + kfree(buffer);
> +
> + return ret;
> +}
> +
> +static int ch348_configure(struct ch348 *ch348, int portnum)
> +{
> + int ret;
> +
> + ret =3D ch348_do_magic(ch348, portnum, CMD_W_R, R_C2, 0x87);
> + if (ret)
> + return ret;
> +
> + return ch348_do_magic(ch348, portnum, CMD_W_R, R_C4, 0x08);
> +}
> +
> +static void ch348_process_read_urb(struct urb *urb)
> +{
> + struct usb_serial_port *port =3D urb->context;
> + struct ch348 *ch348 =3D usb_get_serial_data(port->serial);
> + unsigned int portnum, usblen, i;
> + struct ch348_rxbuf *rxb;
> +
> + if (urb->actual_length < 2) {
> + dev_dbg(&ch348->udev->dev, "Empty rx buffer\n");
> + return;
> + }
> +
> + for (i =3D 0; i < urb->actual_length; i +=3D =
CH348_RX_PORT_CHUNK_LENGTH) {
> + rxb =3D urb->transfer_buffer + i;
> + portnum =3D rxb->port;
> + if (portnum >=3D CH348_MAXPORT) {
> + dev_dbg(&ch348->udev->dev, "Invalid port %d\n", portnum);
> + break;
> + }
> +
> + port =3D ch348->serial->port[portnum];
> +
> + usblen =3D rxb->length;
> + if (usblen > CH348_RX_PORT_MAX_LENGTH) {
> + dev_dbg(&port->dev, "Invalid length %d for port %d\n",
> + usblen, portnum);
> + break;
> + }
> +
> + tty_insert_flip_string(&port->port, rxb->data, usblen);
> + tty_flip_buffer_push(&port->port);
> + port->icount.rx +=3D usblen;
> + usb_serial_debug_data(&port->dev, __func__, usblen, rxb->data);
> + }
> +}
> +
> +static int ch348_prepare_write_buffer(struct usb_serial_port *port, =
void *dest, size_t size)
> +{
> + struct ch348_txbuf *rxt =3D dest;
> + int count;
> +
> + count =3D kfifo_out_locked(&port->write_fifo, rxt->data,
> + size - CH348_TX_HDRSIZE, &port->lock);
> +
> + rxt->port =3D port->port_number;
> + rxt->length =3D cpu_to_le16(count);
> +
> + return count + CH348_TX_HDRSIZE;
> +}
> +
> +static int ch348_write(struct tty_struct *tty, struct usb_serial_port =
*port,
> +       const unsigned char *buf, int count)
> +{
> + struct ch348 *ch348 =3D usb_get_serial_data(port->serial);
> + struct ch348_port *ch348_port =3D &ch348->ports[port->port_number];
> + int ret, max_tx_size;
> +
> + if (tty_get_baud_rate(tty) < 9600 && count >=3D 128)
> + /*
> + * Writing larger buffers can take longer than the hardware
> + * allows before discarding the write buffer. Limit the
> + * transfer size in such cases.
> + * These values have been found by empirical testing.
> + */
> + max_tx_size =3D 128;
> + else
> + /*
> + * Only ingest as many bytes as we can transfer with one URB at
> + * a time. Once an URB has been written we need to wait for the
> + * R_II_B2 status event before we are allowed to send more data.
> + * If we ingest more data then usb_serial_generic_write() will
> + * internally try to process as much data as possible with any
> + * number of URBs without giving us the chance to wait in
> + * between transfers.
> + */
> + max_tx_size =3D port->bulk_out_size - CH348_TX_HDRSIZE;
> +
> + reinit_completion(&ch348_port->write_completion);
> +
> + mutex_lock(&ch348->write_lock);
> +
> + /*
> + * For any (remaining) bytes that we did not transfer TTY core will
> + * call us again, with the buffer and count adjusted to the remaining
> + * data.
> + */
> + ret =3D usb_serial_generic_write(tty, port, buf, min(count, =
max_tx_size));
> +
> + mutex_unlock(&ch348->write_lock);
> +
> + if (ret <=3D 0)
> + return ret;
> +
> + if =
(!wait_for_completion_interruptible_timeout(&ch348_port->write_completion,=

> +       msecs_to_jiffies(CH348_CMD_TIMEOUT))) {
> + dev_err_console(port, "Failed to wait for TX buffer flush\n");
> + return -ETIMEDOUT;
> + }
> +
> + return ret;
> +}
> +
> +static int ch348_set_uartmode(struct ch348 *ch348, int portnum, u8 =
mode)
> +{
> + int ret;
> +
> + if (ch348->ports[portnum].uartmode =3D=3D M_NOR && mode =3D=3D M_HF) =
{
> + ret =3D ch348_do_magic(ch348, portnum, CMD_W_BR, R_C4, 0x51);
> + if (ret)
> + return ret;
> + ch348->ports[portnum].uartmode =3D M_HF;
> + }
> +
> + if (ch348->ports[portnum].uartmode =3D=3D M_HF && mode =3D=3D M_NOR) =
{
> + ret =3D ch348_do_magic(ch348, portnum, CMD_W_BR, R_C4, 0x50);
> + if (ret)
> + return ret;
> + ch348->ports[portnum].uartmode =3D M_NOR;
> + }
> + return 0;
> +}
> +
> +static void ch348_set_termios(struct tty_struct *tty, struct =
usb_serial_port *port,
> +      const struct ktermios *termios_old)
> +{
> + struct ch348 *ch348 =3D usb_get_serial_data(port->serial);
> + struct ktermios *termios =3D &tty->termios;
> + int ret, portnum =3D port->port_number;
> + struct ch348_initbuf *buffer;
> + speed_t baudrate;
> + u8 format;
> +
> + if (termios_old && !tty_termios_hw_change(&tty->termios, =
termios_old))
> + return;
> +
> + buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> + if (!buffer) {
> + if (termios_old)
> + tty->termios =3D *termios_old;
> + return;
> + }
> +
> + /*
> + * The datasheet states that only baud rates in range of =
1200..6000000
> + * are supported. Tests however show that even baud rates as low as =
50
> + * and as high as 12000000 are working in practice.
> + */
> + baudrate =3D clamp(tty_get_baud_rate(tty), 50, 12000000);
> +
> + format =3D termios->c_cflag & CSTOPB ? 2 : 1;
> +
> + buffer->paritytype =3D 0;
> + if (termios->c_cflag & PARENB) {
> + if (termios->c_cflag & PARODD)
> + buffer->paritytype +=3D 1;
> + else
> + buffer->paritytype +=3D 2;
> + if  (termios->c_cflag & CMSPAR)
> + buffer->paritytype +=3D 2;
> + }
> +
> + switch (C_CSIZE(tty)) {
> + case CS5:
> + buffer->databits =3D 5;
> + break;
> + case CS6:
> + buffer->databits =3D 6;
> + break;
> + case CS7:
> + buffer->databits =3D 7;
> + break;
> + case CS8:
> + default:
> + buffer->databits =3D 8;
> + break;
> + }
> + buffer->cmd =3D CMD_WB_E | (portnum & 0x0F);
> + buffer->reg =3D R_INIT;
> + buffer->port =3D portnum;
> + buffer->baudrate =3D cpu_to_be32(baudrate);
> +
> + if (format =3D=3D 2)
> + buffer->format =3D 0x02;
> + else if (format =3D=3D 1)
> + buffer->format =3D 0x00;
> +
> + buffer->rate =3D max_t(speed_t, 5, (10000 * 15 / baudrate) + 1);
> +
> + ret =3D usb_bulk_msg(ch348->udev, ch348->cmd_ep, buffer,
> +   sizeof(*buffer), NULL, CH348_CMD_TIMEOUT);
> + if (ret < 0) {
> + dev_err(&ch348->udev->dev, "Failed to change line settings: =
err=3D%d\n",
> + ret);
> + goto out;
> + }
> +
> + ret =3D ch348_do_magic(ch348, portnum, CMD_W_R, R_C1, 0x0F);
> + if (ret < 0)
> + goto out;
> +
> + if (C_CRTSCTS(tty))
> + ret =3D ch348_set_uartmode(ch348, portnum, M_HF);
> + else
> + ret =3D ch348_set_uartmode(ch348, portnum, M_NOR);
> +
> +out:
> + kfree(buffer);
> +}
> +
> +static int ch348_open(struct tty_struct *tty, struct usb_serial_port =
*port)
> +{
> + struct ch348 *ch348 =3D usb_get_serial_data(port->serial);
> + int ret;
> +
> + if (tty)
> + ch348_set_termios(tty, port, NULL);
> +
> + ret =3D ch348_configure(ch348, port->port_number);
> + if (ret) {
> + dev_err(&ch348->udev->dev, "Fail to configure err=3D%d\n", ret);
> + return ret;
> + }
> +
> + return usb_serial_generic_open(tty, port);
> +}
> +
> +static int ch348_attach(struct usb_serial *serial)
> +{
> + struct usb_endpoint_descriptor *epcmd, *epstatus;
> + struct usb_serial_port *port0 =3D serial->port[1];
> + struct usb_device *usb_dev =3D serial->dev;
> + int status_buffer_size, i, ret;
> + struct usb_interface *intf;
> + struct ch348 *ch348;
> +
> + intf =3D usb_ifnum_to_if(usb_dev, 0);
> + epstatus =3D &intf->cur_altsetting->endpoint[2].desc;
> + epcmd =3D &intf->cur_altsetting->endpoint[3].desc;
> +
> + status_buffer_size =3D usb_endpoint_maxp(epstatus);
> +
> + ch348 =3D kzalloc(struct_size(ch348, status_buffer, =
status_buffer_size),
> + GFP_KERNEL);
> + if (!ch348)
> + return -ENOMEM;
> +
> + usb_set_serial_data(serial, ch348);
> +
> + ch348->udev =3D serial->dev;
> + ch348->serial =3D serial;
> + mutex_init(&ch348->write_lock);
> +
> + for (i =3D 0; i < CH348_MAXPORT; i++)
> + init_completion(&ch348->ports[i].write_completion);
> +
> + ch348->status_urb =3D usb_alloc_urb(0, GFP_KERNEL);
> + if (!ch348->status_urb) {
> + ret =3D -ENOMEM;
> + goto err_free_ch348;
> + }
> +
> + usb_fill_bulk_urb(ch348->status_urb, ch348->udev,
> +  usb_rcvbulkpipe(ch348->udev, epstatus->bEndpointAddress),
> +  ch348->status_buffer, status_buffer_size,
> +  ch348_process_status_urb, ch348);
> +
> + ret =3D usb_submit_urb(ch348->status_urb, GFP_KERNEL);
> + if (ret) {
> + dev_err(&ch348->udev->dev,
> + "%s - failed to submit status/interrupt urb %i\n",
> + __func__, ret);
> + goto err_free_status_urb;
> + }
> +
> + ret =3D usb_serial_generic_submit_read_urbs(port0, GFP_KERNEL);
> + if (ret)
> + goto err_kill_status_urb;
> +
> + ch348->cmd_ep =3D usb_sndbulkpipe(usb_dev, epcmd->bEndpointAddress);
> +
> + return 0;
> +
> +err_kill_status_urb:
> + usb_kill_urb(ch348->status_urb);
> +err_free_status_urb:
> + usb_free_urb(ch348->status_urb);
> +err_free_ch348:
> + kfree(ch348);
> + return ret;
> +}
> +
> +static void ch348_release(struct usb_serial *serial)
> +{
> + struct ch348 *ch348 =3D usb_get_serial_data(serial);
> +
> + usb_kill_urb(ch348->status_urb);
> + usb_free_urb(ch348->status_urb);
> +
> + kfree(ch348);
> +}
> +
> +static void ch348_print_version(struct usb_serial *serial)
> +{
> + u8 *version_buf;
> + int ret;
> +
> + version_buf =3D kzalloc(4, GFP_KERNEL);
> + if (!version_buf)
> + return;
> +
> + ret =3D usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, =
0),
> +      CMD_VER,
> +      USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN,
> +      0, 0, version_buf, 4, CH348_CMD_TIMEOUT);
> + if (ret < 0)
> + dev_dbg(&serial->dev->dev, "Failed to read CMD_VER: %d\n", ret);
> + else
> + dev_info(&serial->dev->dev, "Found WCH CH348%s\n",
> + (version_buf[1] & 0x80) ? "Q" : "L");
> +
> + kfree(version_buf);
> +}
> +
> +static int ch348_probe(struct usb_serial *serial, const struct =
usb_device_id *id)
> +{
> + struct usb_endpoint_descriptor *epread, *epwrite, *epstatus, *epcmd;
> + struct usb_device *usb_dev =3D serial->dev;
> + struct usb_interface *intf;
> + int ret;
> +
> + intf =3D usb_ifnum_to_if(usb_dev, 0);
> +
> + ret =3D usb_find_common_endpoints(intf->cur_altsetting, &epread, =
&epwrite,
> + NULL, NULL);
> + if (ret) {
> + dev_err(&serial->dev->dev, "Failed to find basic endpoints =
ret=3D%d\n", ret);
> + return ret;
> + }
> +
> + epstatus =3D &intf->cur_altsetting->endpoint[2].desc;
> + if (!usb_endpoint_is_bulk_in(epstatus)) {
> + dev_err(&serial->dev->dev, "Missing second bulk in (STATUS/INT)\n");
> + return -ENODEV;
> + }
> +
> + epcmd =3D &intf->cur_altsetting->endpoint[3].desc;
> + if (!usb_endpoint_is_bulk_out(epcmd)) {
> + dev_err(&serial->dev->dev, "Missing second bulk out (CMD)\n");
> + return -ENODEV;
> + }
> +
> + ch348_print_version(serial);
> +
> + return 0;
> +}
> +
> +static int ch348_calc_num_ports(struct usb_serial *serial,
> + struct usb_serial_endpoints *epds)
> +{
> + int i;
> +
> + for (i =3D 1; i < CH348_MAXPORT; ++i) {
> + epds->bulk_out[i] =3D epds->bulk_out[0];
> + epds->bulk_in[i] =3D epds->bulk_in[0];
> + }
> +
> + epds->num_bulk_out =3D CH348_MAXPORT;
> + epds->num_bulk_in =3D CH348_MAXPORT;
> +
> + return CH348_MAXPORT;
> +}
> +
> +static int ch348_suspend(struct usb_serial *serial, pm_message_t =
message)
> +{
> + struct ch348 *ch348 =3D usb_get_serial_data(serial);
> +
> + usb_kill_urb(ch348->status_urb);
> +
> + return 0;
> +}
> +
> +static int ch348_resume(struct usb_serial *serial)
> +{
> + struct ch348 *ch348 =3D usb_get_serial_data(serial);
> + int ret;
> +
> + ret =3D usb_submit_urb(ch348->status_urb, GFP_KERNEL);
> + if (ret) {
> + dev_err(&ch348->udev->dev,
> + "%s - failed to submit status/interrupt urb %i\n",
> + __func__, ret);
> + return ret;
> + }
> +
> + ret =3D usb_serial_generic_resume(serial);
> + if (ret)
> + usb_kill_urb(ch348->status_urb);
> +
> + return ret;
> +}
> +
> +static const struct usb_device_id ch348_ids[] =3D {
> + { USB_DEVICE(0x1a86, 0x55d9), },
> + { /* sentinel */ }
> +};
> +
> +MODULE_DEVICE_TABLE(usb, ch348_ids);
> +
> +static struct usb_serial_driver ch348_device =3D {
> + .driver =3D {
> + .owner =3D THIS_MODULE,
> + .name =3D "ch348",
> + },
> + .id_table =3D ch348_ids,
> + .num_ports =3D CH348_MAXPORT,
> + .num_bulk_in =3D 1,
> + .num_bulk_out =3D 1,
> + .open =3D ch348_open,
> + .set_termios =3D ch348_set_termios,
> + .process_read_urb =3D ch348_process_read_urb,
> + .prepare_write_buffer =3D ch348_prepare_write_buffer,
> + .write =3D ch348_write,
> + .probe =3D ch348_probe,
> + .calc_num_ports =3D ch348_calc_num_ports,
> + .attach =3D ch348_attach,
> + .release =3D ch348_release,
> + .suspend =3D ch348_suspend,
> + .resume =3D ch348_resume,
> +};
> +
> +static struct usb_serial_driver * const serial_drivers[] =3D {
> + &ch348_device, NULL
> +};
> +
> +module_usb_serial_driver(serial_drivers, ch348_ids);
> +
> +MODULE_AUTHOR("Corentin Labbe <clabbe@baylibre.com>");
> +MODULE_DESCRIPTION("USB CH348 Octo port serial converter driver");
> +MODULE_LICENSE("GPL");
> --=20
> 2.43.2
>=20
>=20


--Apple-Mail=_34D60EC5-E2AF-439D-AF6D-576764633EEB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEET9u727/azpOjlPU55vUy2S4FSaUFAmZy3oMACgkQ5vUy2S4F
SaUFMw/8CFjN7ysvOwNB1DXyz5XtnDpXYhGQhV/34xFj2Bt+RaunsjB4m8m8GpBB
a/2UnybKq7QHqvxie4sbxzzO6N2ALp/nDeWXeu5ogswIdMzrqD2f3f+stIGHV1j6
tqWwW3y6DqCNQn1o2xw7nqQMPUhEe8VJjh84esjKfzbaBLYDJ/6uQsvS4JnQ0iic
jhrmHmOLaMfc5KAa/hqvp33QVS6GagaJWdN/MKexrvl8dIXwGCI6rbNyEU9pnqql
LDlWB6Spfb3GQeQSu4RAcbBxccGC1/fCi1NJ/1Tx8iw6lEOItmHDHo/UX3+HvKb9
BG+OmbKi5YItPkSZZ336E1AS0S5Z17UP91EkIc9Bn8YaUHymzT/8Vd2sQwzaCz4W
IcZrHx1ZG979jRFG0bZe3xbREqmadpPPasdoeIlZqaiJxx79VQHJVeAkPTPxzTEg
5+aHuNh+n9x5sGYsnssSw9V9YCaVyA71ZiwEURDXApP9bTFEZMoUOhTUHc3CT+u5
jTwzCFECu+qiDCaENTZVzArm9u3HuG0wv37TiYmasLsbViiMOgTPVtx9IkYUy8a2
JkzJe0H8vFIPgn7iuNaWum46Rny98wAuKkhX72YxXxj4KYytY9lIii4px6TgZ7vK
40ocYr4b8UgV3K4eppdfw3OBoAK6R4p93XSSEgze3ofKa0i5GEc=
=qGPP
-----END PGP SIGNATURE-----

--Apple-Mail=_34D60EC5-E2AF-439D-AF6D-576764633EEB--

