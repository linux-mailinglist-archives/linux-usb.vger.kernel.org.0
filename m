Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B233F1D6BBA
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2020 20:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgEQSfT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 May 2020 14:35:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbgEQSfT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 May 2020 14:35:19 -0400
X-Greylist: delayed 150 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 17 May 2020 11:35:19 PDT
Received: from resqmta-po-11v.sys.comcast.net (resqmta-po-11v.sys.comcast.net [IPv6:2001:558:fe16:19:96:114:154:170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2DAC061A0C
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2020 11:35:19 -0700 (PDT)
Received: from resomta-po-12v.sys.comcast.net ([96.114.154.236])
        by resqmta-po-11v.sys.comcast.net with ESMTP
        id aNh4jP0L5lVb3aO5fjz6RD; Sun, 17 May 2020 18:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1589740367;
        bh=svGgfwaFmi9qF3b43u789Rn752Nk6XYnXOJNIbHR3Pk=;
        h=Received:Received:From:To:Subject:Date:Message-ID:MIME-Version:
         Content-Type;
        b=nqcIfMf+cq6p0QzGB8WDTXkHQkvbqaFzs4O2yW0JGT/r8xTn+Cn23z99RYwXwoSOc
         4QfTENoPHoHjL27hrtPYJNF8991fpVYZDcALdlA1HFRzf0ewD+0VBRsDluf4lfcsCs
         mV9SK7wQThce09Ut4aUxMKL1HfmnjAYP4WmSvCzAkpauBnzW3vLgQNPqPkbWS5p+cl
         dgbNukhGc2wpPrwSL5ZLivYueXX9okYG2m7NEolsyAtCvk5XRY1i/gEisyG5t+1IHZ
         isJXD4mzxSVWcpgnV0xA8XKB6ww+RcD3cxFdtC+DyQptJOiOV3ih1hS+q2qHpNTIiE
         KfwV4ny8O+fSQ==
Received: from MichaelPC ([73.87.202.157])
        by resomta-po-12v.sys.comcast.net with ESMTPSA
        id aO5TjpJjjYXtVaO5UjE202; Sun, 17 May 2020 18:32:36 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgeduhedruddtfedguddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkfggtgfgofhtsehtjehgtddvtddvnecuhfhrohhmpedfofhitghhrggvlhcujfhoohhgrghsihgrnhdfuceomhhitghhrggvlhdrhhhoohhgrghsihgrnhestghomhgtrghsthdrnhgvtheqnecuggftrfgrthhtvghrnhepiedtieefvedtjefgffefuedtfeegudduveeikeffueeijeelueejiefggfffjeffnecuffhomhgrihhnpehrrggugigrrdgtohhmnecukfhppeejfedrkeejrddvtddvrdduheejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepofhitghhrggvlhfrvedpihhnvghtpeejfedrkeejrddvtddvrdduheejpdhmrghilhhfrhhomhepmhhitghhrggvlhdrhhhoohhgrghsihgrnhestghomhgtrghsthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-Xfinity-VMeta: sc=0.00;st=legit
From:   "Michael Hoogasian" <michael.hoogasian@comcast.net>
To:     <linux-usb@vger.kernel.org>
Subject: Locating commit which fixed xhci-hcd: Ring expansion failed
Date:   Sun, 17 May 2020 14:32:54 -0400
Message-ID: <002201d62c79$956334a0$c0299de0$@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdYsc4OfjCuQsPTrSHCkX2LYYhmHQw==
Content-Language: en-us
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I previously contacted Sarah Sharp (original author of XHCI files) about
this, but she referred me here. I'm trying to run a UVC driver on a Nexus 5
phone (running LineageOS) and everything works fine for the first 3 runs.
Then on the 4th run, the kernel has an "oops" and dies. I was able to trace
the oops back to being fixed in commit
68e5254adb88bede68285f11fb442a4d34fb550c which when I backport to the kernel
for the Nexus 5, does indeed solve the oops issue. However, I'm still having
problems on the 4th run, even though the kernel doesn't "oops" anymore. Now,
I get these kernel erros: "xhci-hcd xhci-hcd: Ring expansion failed" and
"usb 1-1.1: usbfs: usb_submit_urb returned -12". I have done some searching
online, and I found a couple links, e.g. this one where the poster claims
kernel 4.20 fixed the issue:
https://forum.radxa.com/t/kernel-update-4-20/638 Currently the kernel I am
working with is based off of 3.4. Would anyone happen to know which
commit(s) I need to backport to fix this the ring expansion issue?

Thanks in advance,
Michael

