Return-Path: <linux-usb+bounces-10189-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D198C1FC3
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 10:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32BBFB20DA1
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 08:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEB114B95C;
	Fri, 10 May 2024 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="5nfh2lqx"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AFB7E56B;
	Fri, 10 May 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715329937; cv=none; b=KFpXmBbVUmXSsd+RZ5kG3b09gk6aDhun1uwZDSnqtbgmE0CenptFnK3H4LE8EqALyyHQLfG7YXdS6o2D4EEh5iR+MahTQTr9NkaSdWWdwO1xFtnwylTjk1kF1ruv9iyHf3kYEv5M4Rbv5xsYzhC0jgs7ojdGudTUpTAPbQiuxqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715329937; c=relaxed/simple;
	bh=O5QlNzKEieFeemPSjPetKTGEZJvS6/Rm6jEpk3nt9Iw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NkmX7Yc7eToHUKCTrRa1dw4T999zWD2xfwzQTok+jWcisVY0yuIsPko/4hZ/ZHa6cAAi33pAPr53PNiaQ1f1UyzCaGOmcu+XztJUpGyoKphhv/dky5Tq8qUbI6XlXs6kvJArqH8+rFFpX6SjakZlXen5BM+5Ns/pEBgYE9gxLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=5nfh2lqx; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715329932;
	bh=O5QlNzKEieFeemPSjPetKTGEZJvS6/Rm6jEpk3nt9Iw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=5nfh2lqxco+2LsgxPNL3fozTt3tdhgp9jSbnEarNgykgnc2H6YYz3aHiaXfuQxVhW
	 jOoqUhoGiXYqZrYO+zvU3SiPziqXDBl6/jExnR0e92U56O7+kSo15B1WLd+kchV/iM
	 kvIKItpHKAAbouIGlh8qLq+FtvCLVPOERAHi46LQ48ZokuPunBOPUZsxi9cci1lR2M
	 oznfdORYyR17IqIc9Sip5+F3mjUUWCqZvCXi9Zv5icuNBzLGHB7sganGW8kzEhTHPH
	 LOiaP/BQbIUN7LN36ZGZU2acp+TiQprTMHaQydSo6+om4Zeuon9wsRJ1d9WMYYhraj
	 bE0MwRauPisCg==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: andrzej.p)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 329BA3782009;
	Fri, 10 May 2024 08:32:12 +0000 (UTC)
Message-ID: <cc5073ea-40b4-47a8-845b-95ee70846560@collabora.com>
Date: Fri, 10 May 2024 10:32:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] tools: usb: p9_fwd: add usb gadget packet
 forwarder script
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov
 <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: v9fs@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel@pengutronix.de
References: <20240116-ml-topic-u9p-v4-0-722ed28b0ade@pengutronix.de>
 <20240116-ml-topic-u9p-v4-3-722ed28b0ade@pengutronix.de>
 <e1c8cc99-47e3-4780-87c8-9f4da370ac4b@collabora.com>
Content-Language: en-US
In-Reply-To: <e1c8cc99-47e3-4780-87c8-9f4da370ac4b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michael,

W dniu 10.05.2024 o 10:29, Andrzej Pietrasiewicz pisze:
> Hi Michael,
> 
> W dniu 30.04.2024 o 01:33, Michael Grzeschik pisze:
>> This patch is adding an small python tool to forward 9pfs requests
>> from the USB gadget to an existing 9pfs TCP server. Since currently all
>> 9pfs servers lack support for the usb transport this tool is an useful
>> helper to get started.
>>
>> Refer the Documentation section "USBG Example" in
>> Documentation/filesystems/9p.rst on how to use it.
>>
>> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
>>
>> ---
>> v3 -> v4: -
>> v2 -> v3: -
>> v1 -> v2:
>>    - added usbg 9pfs detailed instructions to 9p.rst doc
>> ---
>>   Documentation/filesystems/9p.rst |  32 +++++++
>>   tools/usb/p9_fwd.py              | 194 +++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 226 insertions(+)
>>
>> diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
>> index 10cf79dc287f8..2467f1ea4a150 100644
>> --- a/Documentation/filesystems/9p.rst
>> +++ b/Documentation/filesystems/9p.rst
>> @@ -67,6 +67,38 @@ To mount a 9p FS on a USB Host accessible via the gadget as 
>> root filesystem::
>>   where <device> is the tag associated by the usb gadget transport.
>>   It is defined by the configfs instance name.
>> +USBG Example
>> +============
>> +
>> +The USB host exports a filesystem, while the gadget on the USB device
>> +side makes it mountable.
>> +
>> +Diod (9pfs server) and the forwarder are on the development host, where
>> +the root filesystem is actually stored. The gadget is initialized during
>> +boot (or later) on the embedded board. Then the forwarder will find it
>> +on the USB bus and start forwarding requests.
>> +
>> +In this case the 9p requests come from the device and are handled by the
>> +host. The reason is that USB device ports are normally not available on
>> +PCs, so a connection in the other direction would not work.
>> +
>> +When using the usbg transport, for now there is no native usb host
>> +service capable to handle the requests from the gadget driver. For
>> +this we have to use the extra python tool p9_fwd.py from tools/usb.
>> +
>> +Just start the 9pfs capable network server like diod/nfs-ganesha e.g.:
>> +
>> +    $ diod -f -n -d 0 -S -l 0.0.0.0:9999 -e $PWD
>> +
>> +Then start the python transport:
>> +
>> +    $ python $kernel_dir/tools/usb/p9_fwd.py -p 9999
>> +
>> +After that the gadget driver can be used as described above.
>> +
>> +One use-case is to use it as an alternative to NFS root booting during
>> +the development of embedded Linux devices.
>> +
>>   Options
>>   =======
>> diff --git a/tools/usb/p9_fwd.py b/tools/usb/p9_fwd.py
>> new file mode 100755
>> index 0000000000000..95208df11abef
>> --- /dev/null
>> +++ b/tools/usb/p9_fwd.py
>> @@ -0,0 +1,194 @@
>> +#!/usr/bin/env python3
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +import argparse
>> +import errno
>> +import logging
>> +import socket
>> +import struct
>> +import sys
>> +import time
>> +
>> +import usb.core
>> +import usb.util
>> +
>> +
>> +class Forwarder:
>> +    HEXDUMP_FILTER = (
>> +        "".join(chr(x).isprintable() and chr(x) or "." for x in range(128)) + 
>> "." * 128
>> +    )
>> +
>> +    @staticmethod
>> +    def _log_hexdump(data):
>> +        if not logging.root.isEnabledFor(logging.TRACE):
>> +            return
>> +        L = 16
>> +        for c in range(0, len(data), L):
>> +            chars = data[c : c + L]
>> +            dump = " ".join(f"{x:02x}" for x in chars)
>> +            printable = "".join(HEXDUMP_FILTER[x] for x in chars)
>> +            line = f"{c:08x}  {dump:{L*3}s} |{printable:{L}s}|"
>> +            logging.root.log(logging.TRACE, "%s", line)
>> +
>> +    def __init__(self, server):
>> +        self.stats = {
>> +            "c2s packets": 0,
>> +            "c2s bytes": 0,
>> +            "s2c packets": 0,
>> +            "s2c bytes": 0,
>> +        }
>> +        self.stats_logged = time.monotonic()
>> +
>> +        dev = usb.core.find(idVendor=0x1D6B, idProduct=0x0109)
> 
> Is this idProduct an assigned number? I can't find it in
> http://www.linux-usb.org/usb.ids. The "9" is obviously a pun on 9pfs,
> a nice trick and it would make sense.
> 
> However, given composition with configfs there's no guarantee that 9pfs will be
> the only USB gadget function present, and so it is not quite clear that Linux
> Foundation's vendor and product ids are always appropriate. What's more, when
> you are not going to the market with products you can use whatever ids you
> please for your own use.
> 
> Given the above, I'd love these two (idVendor and idProduct) to be commandline
> parameters of this script. My user story: whenever I created a gadget with
> configfs it had different ids than the above and this script wouldn't work.

And actually it is perfectly possible to have more than one USB device with
_the same_ vendor and product ids connected. How would this script behave if
that's the case?

Andrzej

> 
> Regards,
> 
> Andrzej
> 
>> +        if dev is None:
>> +            raise ValueError("Device not found")
>> +
>> +        logging.info(f"found device: {dev.bus}/{dev.address}")
>> +
>> +        # dev.set_configuration() is not necessary since g_multi has only one
>> +        usb9pfs = None
>> +        # g_multi adds 9pfs as last interface
>> +        cfg = dev.get_active_configuration()
>> +        for intf in cfg:
>> +            # we have to detach the usb-storage driver from multi gadget since
>> +            # stall option could be set, which will lead to spontaneous port
>> +            # resets and our transfers will run dead
>> +            if intf.bInterfaceClass == 0x08:
>> +                if dev.is_kernel_driver_active(intf.bInterfaceNumber):
>> +                    dev.detach_kernel_driver(intf.bInterfaceNumber)
>> +
>> +            if (
>> +                intf.bInterfaceClass == 0xFF
>> +                and intf.bInterfaceSubClass == 0xFF
>> +                and intf.bInterfaceProtocol == 0x09
>> +            ):
>> +                usb9pfs = intf
>> +        if usb9pfs is None:
>> +            raise ValueError("Interface not found")
>> +
>> +        logging.info(f"claiming interface:\n{usb9pfs}")
>> +        usb.util.claim_interface(dev, usb9pfs.bInterfaceNumber)
>> +        ep_out = usb.util.find_descriptor(
>> +            usb9pfs,
>> +            custom_match=lambda e: 
>> usb.util.endpoint_direction(e.bEndpointAddress)
>> +            == usb.util.ENDPOINT_OUT,
>> +        )
>> +        assert ep_out is not None
>> +        ep_in = usb.util.find_descriptor(
>> +            usb9pfs,
>> +            custom_match=lambda e: 
>> usb.util.endpoint_direction(e.bEndpointAddress)
>> +            == usb.util.ENDPOINT_IN,
>> +        )
>> +        assert ep_in is not None
>> +        logging.info(f"interface claimed")
>> +
>> +        self.ep_out = ep_out
>> +        self.ep_in = ep_in
>> +        self.dev = dev
>> +
>> +        # create and connect socket
>> +        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
>> +        self.s.connect(server)
>> +
>> +        logging.info(f"connected to server")
>> +
>> +    def c2s(self):
>> +        """forward a request from the USB client to the TCP server"""
>> +        data = None
>> +        while data is None:
>> +            try:
>> +                logging.log(logging.TRACE, "c2s: reading")
>> +                data = self.ep_in.read(self.ep_in.wMaxPacketSize)
>> +            except usb.core.USBTimeoutError:
>> +                logging.log(logging.TRACE, "c2s: reading timed out")
>> +                continue
>> +            except usb.core.USBError as e:
>> +                if e.errno == errno.EIO:
>> +                    logging.debug("c2s: reading failed with %s, retrying", 
>> repr(e))
>> +                    time.sleep(0.5)
>> +                    continue
>> +                else:
>> +                    logging.error("c2s: reading failed with %s, aborting", 
>> repr(e))
>> +                    raise
>> +        size = struct.unpack("<I", data[:4])[0]
>> +        while len(data) < size:
>> +            data += self.ep_in.read(size - len(data))
>> +        logging.log(logging.TRACE, "c2s: writing")
>> +        self._log_hexdump(data)
>> +        self.s.send(data)
>> +        logging.debug("c2s: forwarded %i bytes", size)
>> +        self.stats["c2s packets"] += 1
>> +        self.stats["c2s bytes"] += size
>> +
>> +    def s2c(self):
>> +        """forward a response from the TCP server to the USB client"""
>> +        logging.log(logging.TRACE, "s2c: reading")
>> +        data = self.s.recv(4)
>> +        size = struct.unpack("<I", data[:4])[0]
>> +        while len(data) < size:
>> +            data += self.s.recv(size - len(data))
>> +        logging.log(logging.TRACE, "s2c: writing")
>> +        self._log_hexdump(data)
>> +        while data:
>> +            written = self.ep_out.write(data)
>> +            assert written > 0
>> +            data = data[written:]
>> +        if size % self.ep_out.wMaxPacketSize == 0:
>> +            logging.log(logging.TRACE, "sending zero length packet")
>> +            self.ep_out.write(b"")
>> +        logging.debug("s2c: forwarded %i bytes", size)
>> +        self.stats["s2c packets"] += 1
>> +        self.stats["s2c bytes"] += size
>> +
>> +    def log_stats(self):
>> +        logging.info("statistics:")
>> +        for k, v in self.stats.items():
>> +            logging.info(f"  {k+':':14s} {v}")
>> +
>> +    def log_stats_interval(self, interval=5):
>> +        if (time.monotonic() - self.stats_logged) < interval:
>> +            return
>> +
>> +        self.log_stats()
>> +        self.stats_logged = time.monotonic()
>> +
>> +
>> +def main():
>> +    parser = argparse.ArgumentParser(
>> +        description="Forward 9PFS requests from USB to TCP",
>> +    )
>> +
>> +    parser.add_argument(
>> +        "-s", "--server", type=str, default="127.0.0.1", help="server hostname"
>> +    )
>> +    parser.add_argument("-p", "--port", type=int, default=564, help="server 
>> port")
>> +    parser.add_argument("-v", "--verbose", action="count", default=0)
>> +
>> +    args = parser.parse_args()
>> +
>> +    logging.TRACE = logging.DEBUG - 5
>> +    logging.addLevelName(logging.TRACE, "TRACE")
>> +
>> +    if args.verbose >= 2:
>> +        level = logging.TRACE
>> +    elif args.verbose:
>> +        level = logging.DEBUG
>> +    else:
>> +        level = logging.INFO
>> +    logging.basicConfig(
>> +        level=level, format="%(asctime)-15s %(levelname)-8s %(message)s"
>> +    )
>> +
>> +    f = Forwarder(server=(args.server, args.port))
>> +
>> +    try:
>> +        while True:
>> +            f.c2s()
>> +            f.s2c()
>> +            f.log_stats_interval()
>> +    finally:
>> +        f.log_stats()
>> +
>> +
>> +if __name__ == "__main__":
>> +    main()
>>
> 


