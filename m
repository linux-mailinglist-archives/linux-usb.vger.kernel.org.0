Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35BB3B9DE7
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 11:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhGBJNF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 05:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhGBJND (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jul 2021 05:13:03 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58035C061762
        for <linux-usb@vger.kernel.org>; Fri,  2 Jul 2021 02:10:30 -0700 (PDT)
Received: from miraculix.mork.no (fwa219.mork.no [192.168.9.219])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 1629AIBo007218
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 2 Jul 2021 11:10:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1625217018; bh=MBceFsNSyhZulFkB99tQNmcq6Lk1CtAol3vAVIJQKug=;
        h=From:To:Subject:References:Date:Message-ID:From;
        b=bP9ZU+n9l0EE0zd6WcalpNC/g1bXg9lw4ZGupROJj3mpg4ylMvyNsTVEPCrQXnwxP
         Az1Z+24Jkhk1Sa8WxTZLuy2m8W7Fvfjv76VOeUftZZNxpWYGAJDziDvEhoXqVoU05M
         6FHZuZrjQ4FPU+8ueNzH8fczjKpmTHzODzSfXN7M=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94.2)
        (envelope-from <bjorn@mork.no>)
        id 1lzFBh-000HCi-OE; Fri, 02 Jul 2021 11:10:17 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>
Subject: Re: [PATCH] xhci: add quirk for host controllers that don't update
 endpoint DCS
Organization: m
References: <20210702071338.42777-1-bjorn@mork.no>
        <202107021602.N49dsX2f-lkp@intel.com>
Date:   Fri, 02 Jul 2021 11:10:17 +0200
In-Reply-To: <202107021602.N49dsX2f-lkp@intel.com> (kernel test robot's
        message of "Fri, 2 Jul 2021 16:57:33 +0800")
Message-ID: <87h7hdf5dy.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.2 at canardo
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

kernel test robot <lkp@intel.com> writes:

> All errors (new ones prefixed by >>):
>
>    drivers/usb/host/xhci-ring.c: In function 'xhci_move_dequeue_past_td':
>>> drivers/usb/host/xhci-ring.c:613:32: error: 'cur_td' undeclared (first =
use in this function)
>      613 |   halted_seg =3D trb_in_td(xhci, cur_td->start_seg,
>          |                                ^~~~~~
>    drivers/usb/host/xhci-ring.c:613:32: note: each undeclared identifier =
is reported only once for each function it appears in
>>> drivers/usb/host/xhci-ring.c:620:3: error: 'state' undeclared (first us=
e in this function); did you mean 'statx'?
>      620 |   state->new_cycle_state =3D halted_trb->generic.field[3] & 0x=
1;
>          |   ^~~~~
>          |   statx

Ouch.  Sorry, this is embarrassing.  What you get for testing on stable
kernels and submitting to master.

Please ignore this patch. Will fix.



Bj=C3=B8rn
