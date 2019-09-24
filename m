Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90C3DBC21D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 08:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390760AbfIXG6h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 02:58:37 -0400
Received: from canardo.mork.no ([148.122.252.1]:49813 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390221AbfIXG6h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Sep 2019 02:58:37 -0400
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id x8O6wReZ011703
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 24 Sep 2019 08:58:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1569308311; bh=a7xeyEsOoChi6H00crIlVBEcB7rz4haiAiNZBtKQok8=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=DdZnlwAtKVmW6wpdYKZW3yfdMXX0Cv2jma0/pyyL+C+YS358GqEmslusPG4IKOPGW
         t/GPXXnydvKf237ygTItsuh9VYMV6d8BZdrtPCpOs+SWBIBAlL0aLJ7ltmZdB1Z0/m
         LwQhUESsd4wt/PLMPQ8xGoL3TJyzmxIiQZ//uqYY=
Received: from bjorn by miraculix.mork.no with local (Exim 4.92)
        (envelope-from <bjorn@mork.no>)
        id 1iCemI-0006QG-Nd; Tue, 24 Sep 2019 08:58:26 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Aaron Thompson <dev@aaront.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Moschip 7703 USB to serial free to a good home
Organization: m
References: <0100016d5bc55d05-d2c923f3-a4bb-4ba7-8adc-031b7d933b52-000000@email.amazonses.com>
Date:   Tue, 24 Sep 2019 08:58:26 +0200
In-Reply-To: <0100016d5bc55d05-d2c923f3-a4bb-4ba7-8adc-031b7d933b52-000000@email.amazonses.com>
        (Aaron Thompson's message of "Mon, 23 Sep 2019 01:38:44 +0000")
Message-ID: <871rw6ch9p.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.101.4 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Aaron Thompson <dev@aaront.org> writes:

> I have a Moschip 7703 USB to single serial port adapter that I'm not
> using primarily because it doesn't have an in-tree driver, so I'd be
> happy to send it to anyone who would like to add support for it. It
> looks like it should be easy to add to the existing mos7720 driver.
> Anyone interested?

Sorry, not interested.  But did you try the obvious fix, even mentioned
here under "Moschip MCS7720, MCS7715 driver"?:
https://www.kernel.org/doc/Documentation/usb/usb-serial.txt

Just add the VID/PID to the device table and see what happens.  Just
post any error messages or other stuff here, along with the patch you
are testing, and you will get help interpreting it.

Note that you'll probably have to do a minor change in the
mos77xx_calc_num_ports() too, since it hardcodes 2 ports. But if you're
lucky then that's it.


Bj=C3=B8rn
