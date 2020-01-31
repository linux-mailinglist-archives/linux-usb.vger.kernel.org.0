Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCDAF14F2D3
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 20:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgAaTg5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 14:36:57 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40330 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbgAaTg5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 14:36:57 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so3829727pfh.7
        for <linux-usb@vger.kernel.org>; Fri, 31 Jan 2020 11:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H500U7AxkRvelxApN+urqqo/2yVbfr5vZr0IVmQ3Nec=;
        b=i1XoWGVoLQbEXgmvo4oG4PWhA5M9ZP4NOHk+omlGlW7/pRO5h2d+k8anRiz9c8qdWa
         t3h7CbXOQL3C5fuGz2ElrnPI/W2tbb6HcfGwQLV82rX5RTsSdxjQnLKch42F5Szb3MUQ
         kwBWL6dsO4h7GwukMAcoid0+rrOmd/c4xs1tuaYYbfcEjGKUdHA/mDNF359nPcnlAGD+
         KpP7Btbaw0cT9TKGVq4aAeewjrNc8+kUG2RAHf0bSlCyJsQsFAzUo/Hk8s8V0wAat7qb
         CmUGEXFp/zL3kYZSJraqqaQItPn+v05NAwraN16B18i/xtkJZ2+RPH2eqD44qASb40Hg
         RNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H500U7AxkRvelxApN+urqqo/2yVbfr5vZr0IVmQ3Nec=;
        b=TG0aKJ2XlUFSPDI6sD/eSYdwBAJEPm57FVi+6eq3TBqwRmeq2rIxpllZcl/kNTHB5C
         pn3CctY+Wo9X0/oWeVfzb444XCF6j6x1L1Zwx8b97nXaRW7kIqsSwRwXiG6tbwKUPYd0
         7f7um7v1HDkoQU7JT3bTf4cEAMSyZsVPleUUKEzB95phqDtC52AUPSM1A19kpTxl07QD
         lsEZr5Qar9GLzo5QaE15noOafQlUbx1ACs9QODv5JbpYiXxoXPGXEgrp+fN1Hhck3FeY
         I6J1Xefnbp1eqGaKUswpILb6VByJJjpf3lX0I3hkqQt8cFzOzvey9EsFiT7K9ZQTIL8L
         oHmQ==
X-Gm-Message-State: APjAAAU4pERfwMkYCj/8pZgCXyVJO42yCOPAbi6ujluSzi96DiFJf3oE
        vNUKXFhljRfiNqGelmiZwOoitP1TxFc=
X-Google-Smtp-Source: APXvYqwgAkLkZhoYUiACRWRIV+kbJHbe8stRTvMLcippHTt57tgxKOuz01lFw4uETvLLVM8aEvNsnw==
X-Received: by 2002:a63:5964:: with SMTP id j36mr11968514pgm.225.1580499416737;
        Fri, 31 Jan 2020 11:36:56 -0800 (PST)
Received: from EliteBook ([75.167.220.149])
        by smtp.gmail.com with ESMTPSA id g19sm11306594pfh.134.2020.01.31.11.36.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 11:36:56 -0800 (PST)
Date:   Fri, 31 Jan 2020 12:36:53 -0700
From:   Paul Zimmerman <pauldzim@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <greg@kroah.com>,
        David Heinzelmann <heinzelmann.david@gmail.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: hub: Don't record a connect-change event during
 reset-resume
Message-ID: <20200131123653.2ef373e4@EliteBook>
In-Reply-To: <Pine.LNX.4.44L0.2001311037460.1577-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.2001311037460.1577-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 31 Jan 2020 10:39:26 -0500 (EST)
Alan Stern <stern@rowland.harvard.edu> wrote:

> Paul Zimmerman reports that his USB Bluetooth adapter sometimes
> crashes following system resume, when it receives a
> Get-Device-Descriptor request while it is busy doing something else.
> 
> Such a request was added by commit a4f55d8b8c14 ("usb: hub: Check
> device descriptor before resusciation").  It gets sent when the hub
> driver's work thread checks whether a connect-change event on an
> enabled port really indicates a new device has been connected, as
> opposed to an old device momentarily disconnecting and then
> reconnecting (which can happen with xHCI host controllers, since they
> automatically enable connected ports).

< snip > 

> Note that performing the unnecessary check is not actually a bug.
> Devices are supposed to be able to send descriptors back to the host
> even when they are busy doing something else.  The underlying cause of
> Paul's problem lies in his Bluetooth adapter.  Nevertheless, we
> shouldn't perform the same check twice in a row -- and as a nice side
> benefit, removing the extra check allows the Bluetooth adapter to work
> more reliably.

Actually, at the time the failure happens, the bluetooth driver is putting
the device into a "manufacturer mode" and downloading a firmware patch to
the device. So I don't think we can fault the device for not responding to
a get-descriptor request at that point. Probably there should be some kind
of locking in the driver while that is being done.

Nevertheless, your patch makes everything work again, so I think it's
"good enough" :)

Thanks,
Paul
