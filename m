Return-Path: <linux-usb+bounces-14139-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF32895FC02
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 23:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D1631F23171
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 21:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511EB19CD12;
	Mon, 26 Aug 2024 21:47:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CC619B3F6
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 21:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724708868; cv=none; b=VsPAv8pTQa4MdpiARFJ3FjtOjehgrXRWu4esyJcAFcNdVUNuAInk9B2RhNb4v4cZ93TzrWvc1smsCHKdCTcv7Tbp32kmsHixRIO2vinD6RcIDgqqhLfOtd/gpzZi9JUuUNm7qf8HsxhqN2yLnMpT5JO/B513lzvtrHEeKPpiC+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724708868; c=relaxed/simple;
	bh=wbEbRP15btuZZOK5VbdfdEWjZ9qHEu2EOZwKfAdcWEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z4jj4ugXLf7az97R9BYIsTRGrznn9mKRIWAAfOcSHMhEtSdJUh09Pt/YvxPkAhYyC7jFbQpTqHF6hcATUD4QDAIOed71Avc6Ipz3nV4e84j5dOe9SPqYfviq6H2mLN6HWu8x+L+obBEhInEHJQc34eUnkaI93byCtIbdfU7wWfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sihYj-0006Uy-Ml; Mon, 26 Aug 2024 23:47:33 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sihYh-003HK9-SF; Mon, 26 Aug 2024 23:47:31 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1sihYh-002LCx-15;
	Mon, 26 Aug 2024 23:47:31 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Date: Mon, 26 Aug 2024 23:47:31 +0200
Subject: [PATCH v10 3/3] tools: usb: p9_fwd: add usb gadget packet
 forwarder script
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-ml-topic-u9p-v10-3-a85fdeac2c52@pengutronix.de>
References: <20240116-ml-topic-u9p-v10-0-a85fdeac2c52@pengutronix.de>
In-Reply-To: <20240116-ml-topic-u9p-v10-0-a85fdeac2c52@pengutronix.de>
To: Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, v9fs@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, kernel@pengutronix.de, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>, 
 Jan Luebbe <jlu@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12459;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=wbEbRP15btuZZOK5VbdfdEWjZ9qHEu2EOZwKfAdcWEs=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBmzPfzL2GtJIYZ/3ug3IEsd2AzWKbMaYTlqnoJ5
 xg6Zra5SOCJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZsz38wAKCRC/aVhE+XH0
 q3ebD/9q7wDNRJUGKTSH+QximRHgQq272xD8QZOpJC7/pT67r9JwX/dfdd7SREU4CjKNxrGZJ6a
 tdoB5N8rxofaCsctxLhGGGZ3W3d4kGJEFVBn/uwopmXXy8/HTsaq/daVjaaGREtQmWI1VazrjhO
 IObQ1yJnAAgGzWbkBeRehYIRqU9JIceQjLVyEQj09VqZEoIMnM2imB+xq0XDwsBkyzPPpWYo8WC
 xNzSHUExnFgcxesIQCzNBA/9TOXMKO4y8SxbThBPHcY799zwa/HiVJ98TIzkDlQ1VXj6gDHW0jx
 aYkmHekWUEEPcwJzl0xoqoOVGMbvFaUk2jeHm/sjAJSLJat5vlyJ6IjJYW7ehRPp3t7+TnohDQU
 ub3ol4zzYnkwNWvSVliibWzof3wiBgNcJsqpI6+vrSJr5Po33QR4jSW9mB7EC61ZVsHNLHwsbou
 szMSsFylaKbsZrMpXvX7l6C6GU5xzSoGBr1/0bsHrHWrcAQehNUnnrjR2K/kEsQm4VticQnZE+3
 Ra11jMy3LwbzaLuEP6JFIf48QemsFjMcO8SKhKmtLN7esyrqg0Wt3j4YEkUReulZ5uvsp4b5+iq
 Oy6HLtiKC5FOUNMKhRS140Wbt6a3C8NetFda7FwxLMqd4n80CmKAJT+IyxDRfsoN8b+DfN11ohu
 sBxDxzOrxORmKNg==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

This patch is adding an small python tool to forward 9pfs requests
from the USB gadget to an existing 9pfs TCP server. Since currently all
9pfs servers lack support for the usb transport this tool is an useful
helper to get started.

Refer the Documentation section "USBG Example" in
Documentation/filesystems/9p.rst on how to use it.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

---
v6 -> v9: -
v5 -> v6:
  - set path parameter to None when unused
v4 -> v5:
  - updated documentation for new subcommands list/connect
  - run ruff format
  - make vid and pid parameterized
  - add list as subcommand to scan for devices
  - move connect to extra subcommand
v2 -> v4: -
v1 -> v2:
  - added usbg 9pfs detailed instructions to 9p.rst doc
---
 Documentation/filesystems/9p.rst |  41 +++++++
 tools/usb/p9_fwd.py              | 243 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 284 insertions(+)

diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
index 10cf79dc287f8..2cc85f3e8659f 100644
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@ -67,6 +67,47 @@ To mount a 9p FS on a USB Host accessible via the gadget as root filesystem::
 where <device> is the tag associated by the usb gadget transport.
 It is defined by the configfs instance name.
 
+USBG Example
+============
+
+The USB host exports a filesystem, while the gadget on the USB device
+side makes it mountable.
+
+Diod (9pfs server) and the forwarder are on the development host, where
+the root filesystem is actually stored. The gadget is initialized during
+boot (or later) on the embedded board. Then the forwarder will find it
+on the USB bus and start forwarding requests.
+
+In this case the 9p requests come from the device and are handled by the
+host. The reason is that USB device ports are normally not available on
+PCs, so a connection in the other direction would not work.
+
+When using the usbg transport, for now there is no native usb host
+service capable to handle the requests from the gadget driver. For
+this we have to use the extra python tool p9_fwd.py from tools/usb.
+
+Just start the 9pfs capable network server like diod/nfs-ganesha e.g.:
+
+        $ diod -f -n -d 0 -S -l 0.0.0.0:9999 -e $PWD
+
+Optionaly scan your bus if there are more then one usbg gadgets to find their path:
+
+        $ python $kernel_dir/tools/usb/p9_fwd.py list
+
+        Bus | Addr | Manufacturer     | Product          | ID        | Path
+        --- | ---- | ---------------- | ---------------- | --------- | ----
+          2 |   67 | unknown          | unknown          | 1d6b:0109 | 2-1.1.2
+          2 |   68 | unknown          | unknown          | 1d6b:0109 | 2-1.1.3
+
+Then start the python transport:
+
+        $ python $kernel_dir/tools/usb/p9_fwd.py --path 2-1.1.2 connect -p 9999
+
+After that the gadget driver can be used as described above.
+
+One use-case is to use it as an alternative to NFS root booting during
+the development of embedded Linux devices.
+
 Options
 =======
 
diff --git a/tools/usb/p9_fwd.py b/tools/usb/p9_fwd.py
new file mode 100755
index 0000000000000..12c76cbb046b7
--- /dev/null
+++ b/tools/usb/p9_fwd.py
@@ -0,0 +1,243 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import argparse
+import errno
+import logging
+import socket
+import struct
+import time
+
+import usb.core
+import usb.util
+
+
+def path_from_usb_dev(dev):
+    """Takes a pyUSB device as argument and returns a string.
+    The string is a Path representation of the position of the USB device on the USB bus tree.
+
+    This path is used to find a USB device on the bus or all devices connected to a HUB.
+    The path is made up of the number of the USB controller followed be the ports of the HUB tree."""
+    if dev.port_numbers:
+        dev_path = ".".join(str(i) for i in dev.port_numbers)
+        return f"{dev.bus}-{dev_path}"
+    return ""
+
+
+HEXDUMP_FILTER = "".join(chr(x).isprintable() and chr(x) or "." for x in range(128)) + "." * 128
+
+
+class Forwarder:
+    @staticmethod
+    def _log_hexdump(data):
+        if not logging.root.isEnabledFor(logging.TRACE):
+            return
+        L = 16
+        for c in range(0, len(data), L):
+            chars = data[c : c + L]
+            dump = " ".join(f"{x:02x}" for x in chars)
+            printable = "".join(HEXDUMP_FILTER[x] for x in chars)
+            line = f"{c:08x}  {dump:{L*3}s} |{printable:{L}s}|"
+            logging.root.log(logging.TRACE, "%s", line)
+
+    def __init__(self, server, vid, pid, path):
+        self.stats = {
+            "c2s packets": 0,
+            "c2s bytes": 0,
+            "s2c packets": 0,
+            "s2c bytes": 0,
+        }
+        self.stats_logged = time.monotonic()
+
+        def find_filter(dev):
+            dev_path = path_from_usb_dev(dev)
+            if path is not None:
+                return dev_path == path
+            return True
+
+        dev = usb.core.find(idVendor=vid, idProduct=pid, custom_match=find_filter)
+        if dev is None:
+            raise ValueError("Device not found")
+
+        logging.info(f"found device: {dev.bus}/{dev.address} located at {path_from_usb_dev(dev)}")
+
+        # dev.set_configuration() is not necessary since g_multi has only one
+        usb9pfs = None
+        # g_multi adds 9pfs as last interface
+        cfg = dev.get_active_configuration()
+        for intf in cfg:
+            # we have to detach the usb-storage driver from multi gadget since
+            # stall option could be set, which will lead to spontaneous port
+            # resets and our transfers will run dead
+            if intf.bInterfaceClass == 0x08:
+                if dev.is_kernel_driver_active(intf.bInterfaceNumber):
+                    dev.detach_kernel_driver(intf.bInterfaceNumber)
+
+            if intf.bInterfaceClass == 0xFF and intf.bInterfaceSubClass == 0xFF and intf.bInterfaceProtocol == 0x09:
+                usb9pfs = intf
+        if usb9pfs is None:
+            raise ValueError("Interface not found")
+
+        logging.info(f"claiming interface:\n{usb9pfs}")
+        usb.util.claim_interface(dev, usb9pfs.bInterfaceNumber)
+        ep_out = usb.util.find_descriptor(
+            usb9pfs,
+            custom_match=lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_OUT,
+        )
+        assert ep_out is not None
+        ep_in = usb.util.find_descriptor(
+            usb9pfs,
+            custom_match=lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_IN,
+        )
+        assert ep_in is not None
+        logging.info("interface claimed")
+
+        self.ep_out = ep_out
+        self.ep_in = ep_in
+        self.dev = dev
+
+        # create and connect socket
+        self.s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+        self.s.connect(server)
+
+        logging.info("connected to server")
+
+    def c2s(self):
+        """forward a request from the USB client to the TCP server"""
+        data = None
+        while data is None:
+            try:
+                logging.log(logging.TRACE, "c2s: reading")
+                data = self.ep_in.read(self.ep_in.wMaxPacketSize)
+            except usb.core.USBTimeoutError:
+                logging.log(logging.TRACE, "c2s: reading timed out")
+                continue
+            except usb.core.USBError as e:
+                if e.errno == errno.EIO:
+                    logging.debug("c2s: reading failed with %s, retrying", repr(e))
+                    time.sleep(0.5)
+                    continue
+                logging.error("c2s: reading failed with %s, aborting", repr(e))
+                raise
+        size = struct.unpack("<I", data[:4])[0]
+        while len(data) < size:
+            data += self.ep_in.read(size - len(data))
+        logging.log(logging.TRACE, "c2s: writing")
+        self._log_hexdump(data)
+        self.s.send(data)
+        logging.debug("c2s: forwarded %i bytes", size)
+        self.stats["c2s packets"] += 1
+        self.stats["c2s bytes"] += size
+
+    def s2c(self):
+        """forward a response from the TCP server to the USB client"""
+        logging.log(logging.TRACE, "s2c: reading")
+        data = self.s.recv(4)
+        size = struct.unpack("<I", data[:4])[0]
+        while len(data) < size:
+            data += self.s.recv(size - len(data))
+        logging.log(logging.TRACE, "s2c: writing")
+        self._log_hexdump(data)
+        while data:
+            written = self.ep_out.write(data)
+            assert written > 0
+            data = data[written:]
+        if size % self.ep_out.wMaxPacketSize == 0:
+            logging.log(logging.TRACE, "sending zero length packet")
+            self.ep_out.write(b"")
+        logging.debug("s2c: forwarded %i bytes", size)
+        self.stats["s2c packets"] += 1
+        self.stats["s2c bytes"] += size
+
+    def log_stats(self):
+        logging.info("statistics:")
+        for k, v in self.stats.items():
+            logging.info(f"  {k+':':14s} {v}")
+
+    def log_stats_interval(self, interval=5):
+        if (time.monotonic() - self.stats_logged) < interval:
+            return
+
+        self.log_stats()
+        self.stats_logged = time.monotonic()
+
+
+def try_get_usb_str(dev, name):
+    try:
+        with open(f"/sys/bus/usb/devices/{dev.bus}-{dev.address}/{name}") as f:
+            return f.read().strip()
+    except FileNotFoundError:
+        return None
+
+
+def list_usb(args):
+    vid, pid = [int(x, 16) for x in args.id.split(":", 1)]
+
+    print("Bus | Addr | Manufacturer     | Product          | ID        | Path")
+    print("--- | ---- | ---------------- | ---------------- | --------- | ----")
+    for dev in usb.core.find(find_all=True, idVendor=vid, idProduct=pid):
+        path = path_from_usb_dev(dev) or ""
+        manufacturer = try_get_usb_str(dev, "manufacturer") or "unknown"
+        product = try_get_usb_str(dev, "product") or "unknown"
+        print(
+            f"{dev.bus:3} | {dev.address:4} | {manufacturer:16} | {product:16} | {dev.idVendor:04x}:{dev.idProduct:04x} | {path:18}"
+        )
+
+
+def connect(args):
+    vid, pid = [int(x, 16) for x in args.id.split(":", 1)]
+
+    f = Forwarder(server=(args.server, args.port), vid=vid, pid=pid, path=args.path)
+
+    try:
+        while True:
+            f.c2s()
+            f.s2c()
+            f.log_stats_interval()
+    finally:
+        f.log_stats()
+
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Forward 9PFS requests from USB to TCP",
+    )
+
+    parser.add_argument("--id", type=str, default="1d6b:0109", help="vid:pid of target device")
+    parser.add_argument("--path", type=str, required=False, help="path of target device")
+    parser.add_argument("-v", "--verbose", action="count", default=0)
+
+    subparsers = parser.add_subparsers()
+    subparsers.required = True
+    subparsers.dest = "command"
+
+    parser_list = subparsers.add_parser("list", help="List all connected 9p gadgets")
+    parser_list.set_defaults(func=list_usb)
+
+    parser_connect = subparsers.add_parser(
+        "connect", help="Forward messages between the usb9pfs gadget and the 9p server"
+    )
+    parser_connect.set_defaults(func=connect)
+    connect_group = parser_connect.add_argument_group()
+    connect_group.required = True
+    parser_connect.add_argument("-s", "--server", type=str, default="127.0.0.1", help="server hostname")
+    parser_connect.add_argument("-p", "--port", type=int, default=564, help="server port")
+
+    args = parser.parse_args()
+
+    logging.TRACE = logging.DEBUG - 5
+    logging.addLevelName(logging.TRACE, "TRACE")
+
+    if args.verbose >= 2:
+        level = logging.TRACE
+    elif args.verbose:
+        level = logging.DEBUG
+    else:
+        level = logging.INFO
+    logging.basicConfig(level=level, format="%(asctime)-15s %(levelname)-8s %(message)s")
+
+    args.func(args)
+
+
+if __name__ == "__main__":
+    main()

-- 
2.39.2


