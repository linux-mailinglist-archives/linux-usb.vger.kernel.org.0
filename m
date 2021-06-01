Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFE543976E7
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 17:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbhFAPmf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 11:42:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230523AbhFAPme (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 11:42:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1C9461396;
        Tue,  1 Jun 2021 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622562052;
        bh=ZpmjbRUCKl6B39HbAKZNBpiYjF5I06zBPiyHBMMvFVM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uUqYwsfJ5nd50KI84VxETbNzIQNcfv75yTbIIQDlJwzxKIupz50eM2SYes/abjGk7
         xn4claNE6keWxca+6PUoSO/8URkSIZgU72sSN7P5XXS7uvz3+zIljgjtCz7zzfoqy2
         dkVNHp6jUZ2VlueamZYeKEmTcMLv9daq1jMS+nSnatjY+id4b+CabeVlpKKOgNBF4J
         HfImjFoJOOrv8UjVxarvFtki92GKhAGSr0bwh3XEIYcxgpfFCghcBA04Xs6lOlqfkD
         E1YaK9MBwPqlHyFBZoq6okjDfmuQ2iJWKejEsuYbS5BMDqm3hB/HFTtTaHczdke8RX
         ujRKrfUpsZMkA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lo6Ve-0006qy-O8; Tue, 01 Jun 2021 17:40:51 +0200
Date:   Tue, 1 Jun 2021 17:40:50 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alex =?utf-8?B?VmlsbGFjw61z?= Lasso <a_villacis@palosanto.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21
 (with bisection)
Message-ID: <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 01, 2021 at 09:51:56AM -0500, Alex Villacís Lasso wrote:

> Here is the full result of the test I performed. First I installed the 
> distro kernel update, kernel-5.12.8-300.fc34.x86_64, then rebooted. 
> Anything with a date is the journalctl output. Everything else is 
> console input and output. I have pasted the relevant journalctl messages 
> immediately after the command or action that triggered them.

> $ miniterm.py /dev/ttyUSB0 115200
> Traceback (most recent call last):
>    File "/usr/bin/miniterm.py", line 976, in <module>
>      main()
>    File "/usr/bin/miniterm.py", line 932, in main
>      serial_instance.open()
>    File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 
> 288, in open
>      self._update_rts_state()
>    File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 
> 627, in _update_rts_state
>      fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
> BrokenPipeError: [Errno 32] Broken pipe
> 
> jun 01 09:23:43 karlalex-asus systemd[1665]: Started VTE child process 
> 3306 launched by gnome-terminal-server process 2856.
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 9600
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0303
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_change_speed - setting baud rate to 115384
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_set_flow_control - ctrl = 0x01, flow = 0x40
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0101
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0202
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32
> jun 01 09:23:55 karlalex-asus python3[3362]: detected unhandled Python 
> exception in '/usr/bin/miniterm.py'
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
> cp210x_tiocmset_port - control = 0x0300
> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
> 0x7 status: -32

Thanks a lot for this.

Could you try applying the below patch, and with debugging enabled

	1. plug the device in
	2. start the terminal program 

and then send me the logs?

This should show the current device settings which appear to have flow
control enabled (which the driver fails to disable).

> I note that the mere act of running stty -a on the device also triggers 
> the error.

Yeah, you'll see this error on every open/close when the driver tries to
assert/deassert RTS.

Johan


From 736c4c099591317d55a20da627db3b148d8d71ca Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Tue, 1 Jun 2021 17:29:01 +0200
Subject: [PATCH] USB: cp210x: add flow-control debugging

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index ee595d1bea0a..92382798b574 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1159,6 +1159,12 @@ static void cp210x_set_flow_control(struct tty_struct *tty,
 	ctl_hs = le32_to_cpu(flow_ctl.ulControlHandshake);
 	flow_repl = le32_to_cpu(flow_ctl.ulFlowReplace);
 
+	dev_dbg(&port->dev, "%s - ctrl = 0x%02x, flow = 0x%02x\n", __func__,
+			ctl_hs, flow_repl);
+	dev_dbg(&port->dev, "%s - xon_limit = %u, xoff_limit = %u\n", __func__,
+			le32_to_cpu(flow_ctl.ulXonLimit),
+			le32_to_cpu(flow_ctl.ulXoffLimit));
+
 	ctl_hs &= ~CP210X_SERIAL_DSR_HANDSHAKE;
 	ctl_hs &= ~CP210X_SERIAL_DCD_HANDSHAKE;
 	ctl_hs &= ~CP210X_SERIAL_DSR_SENSITIVITY;
-- 
2.31.1

