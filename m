Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A28A3F8761
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2019 05:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfKLEZ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 23:25:58 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:55997 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKLEZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Nov 2019 23:25:58 -0500
Received: by mail-wm1-f53.google.com with SMTP id b11so1540448wmb.5
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2019 20:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :content-transfer-encoding;
        bh=o6iwpRiDO0vPj6iGT20Dh1tRzNDhva6KOXdaIVQ5tIE=;
        b=aQUFIvATMODa8lrZqhJKjoecdAXeY5QyFSzIjYbgNewbIi0I3EB0w5K/SxHbMSoYH8
         LHqBvrB9Qf/HtSf2kqCvT+zRkNqYCtouz9ma8TmWigqKpsaXSru1EtxMTmk3rjzZWi+n
         EX4N3TNfXYy0dkCUbItM3++aoG/F9Q2yyE0gDxQwmg0vpHRJk5YZxqyBJDWgtdyg0X0F
         dMYUPiScygwbm12dkUrg68ELXA3a0oYDqr1rQ3QN3sH4WiSOV8l8OqbBuU+2MRTVZjax
         Ai16UOJNxWJuVKBcH06qEAnIqYxXjjKrQ88CUOe6TuWazHC1Ld3kdnFurkNdfPqLrf8l
         95pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
         :cc:subject:content-transfer-encoding;
        bh=o6iwpRiDO0vPj6iGT20Dh1tRzNDhva6KOXdaIVQ5tIE=;
        b=BaO9NDwJgu1M+hlkDiDPUL2+6RTYUte35PUXW0X+9Z7YcLM2fpgHtcbzAxBhrvx7I0
         IxNveii3IURI2Dspa+44rY1AJSrv1DWDKU3HeU/LVah0MKDgQra0Wtnd7H4IQ69jDWVE
         n3gmxokqx+bo+W1vdeCT17epd+eldc3rQ8PhW8/1VqXQUhVBeRi9SyBCc+C7MQpuyW8v
         A7Dxf/0hLMDgVchP/UXycvdEVIMwLD64kgyC5XYLaHIpjJ85ivDED8HEwmTMcpSvt1My
         Grx+7T19L4K8oAYr+edblWJWvsowFQUxCLyUARSk1Ahlnd3j+Tx+ngbDrA3BvWuYkpd/
         npJQ==
X-Gm-Message-State: APjAAAXW5s4ggpYr8jyPkvoPYQPi8fpaDTY2aGqk7Gpt/JkEoufiqOT4
        Xb2ZtcM3lUVwuF2jGg4XI2g=
X-Google-Smtp-Source: APXvYqzB7PyS8tZaRQwUq5Z7JdNQ2s07mgh9EvOgR+46ZWMLlfjn3Lw9zF4afP0sIjVczF4Jxs00iQ==
X-Received: by 2002:a1c:9a4f:: with SMTP id c76mr1929700wme.103.1573532756653;
        Mon, 11 Nov 2019 20:25:56 -0800 (PST)
Received: from [109.186.90.35] (109-186-90-35.bb.netvision.net.il. [109.186.90.35])
        by smtp.gmail.com with ESMTPSA id b15sm10171755wrx.77.2019.11.11.20.25.54
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Nov 2019 20:25:55 -0800 (PST)
Message-ID: <5DCA343A.4000304@gmail.com>
Date:   Tue, 12 Nov 2019 06:25:30 +0200
From:   Eli Billauer <eli.billauer@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.12) Gecko/20100907 Fedora/3.0.7-1.fc12 Thunderbird/3.0.7
MIME-Version: 1.0
To:     Mathias Nyman <mathias.nyman@intel.com>
CC:     linux-usb@vger.kernel.org
Subject: xhci-ring: "needs XHCI_TRUST_TX_LENGTH quirk" in kernel log
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Connecting a custom designed (on FPGA) USB 3.0 device to a Renesas 
uPD720202 (1912:0015) and kernel v5.3.0, I get a lot of messages in the 
kernel log, while transmitting data at a high bandwidth through a BULK 
IN endpoint:

handle_tx_event: 36590 callbacks suppressed
xhci_hcd 0000:03:00.0: WARN Successful completion on short TX for slot 1 
ep 18: needs XHCI_TRUST_TX_LENGTH quirk?
(last message repeated several times)

The driver in charge, as reported by lspci, is xhci_hcd.

Probably relevant details:

* The buffer size of the USB transactions is 32 kiB and up (with 
libusb). With e.g. 16 kiB buffers these log messages don't appear.
* The device produces short packets occasionally. When only full-length 
packets are sent, these log messages don't appear.
* Other than these log messages, everything works fine. In particular, 
there are no errors in the data exchange in either situation.
* This problem doesn't happen when running the same test on an Intel 
B150 chipset’s USB 3.0 xHCI controller (8086:a12f).

I don't really know what this warning means, but this whole thing 
kind-of reminds the "WARN Event TRB for slot x ep y with no TDs queued" 
issue that was solved recently. Just a wild guess.

Any idea how this can be fixed?

Thanks and regards,
    Eli

