Return-Path: <linux-usb+bounces-3417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A86567FBD97
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 16:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6369D28265D
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 15:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F54B5C08D;
	Tue, 28 Nov 2023 15:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YuqoL6rA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0011B5
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 07:01:46 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-41cdc669c5eso185041cf.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 07:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701183705; x=1701788505; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=51z15QLCTvUCxMQGRCe0dIJ/n54kd0sYe/k+835mZ+Q=;
        b=YuqoL6rA3uuOkl8O2VFudG+nU+jD/4CNGD63jsk6OSrXUnZbiDD/qfuEr732ynH/Na
         tohYIOH9fw4DAGUrCc0aNuioZH14ytEzkR+ie8xVBxg5DEJMqANaLVCLYn9RDFa0JX2A
         dcJNpJ7N5xozOOzOvHwRvfVmhEWb0NMqXOgW3kEGFtVjGPS1zr0aB/l97hlhmXbElnmp
         5Z2YwOjvh5oJ2ABRxNhMCa9Pku8xJeGNfSSCd6tCsMDsefxyzAnllEO2jd3ONVWIIJOo
         ilpxXWJ+zUdN/HqK3HDwrpHTqszE0ClevArOauGwQ2fnPCrCfiRiXv3Xh4v+MOlfnh5S
         GWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701183705; x=1701788505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51z15QLCTvUCxMQGRCe0dIJ/n54kd0sYe/k+835mZ+Q=;
        b=IYL6148bifUzayfFiZ3iedcg32KIpkpkfenZiDJEYGePD6hIcnb/MPjnWPmUG0s6gT
         gl5k1PAJH2VPuqhvQN/TKrRtQBj1KA208fInn7jwLs80Mf3FlVlx7bhElkokIhgAHQ3o
         jQlAObj2s8lXK3FWT9O1TVQzyiyxmRFJVUNggfq9xBkenS7XWkNMVxCHskjZ8wehG5jo
         EK0+uXmrRLwa82bAibUUOFXoQcPyGXK9W7dqMx9VAoHaFv92kY0ANn0kQ7Y9lBwm7GDv
         Xmm1cZOpMuZ4J48AoR8d8AbE4N1tiTIXLwsKaFWa7S8pYA8f4d/ZnUNwmxY3kF1/bjva
         sTfA==
X-Gm-Message-State: AOJu0Yxenjpjumy7UWN0W9xzQGSQAWhGgbyKfJLeIGq5ZeJ/rode4zUi
	4hrg6OuXfjitTHgzz0EEVUvFzoMNcrTG/+VKX0cROw==
X-Google-Smtp-Source: AGHT+IEnnqJc8lfN5xFbLFc8UvzSuJ8lofgbBb9+EyaycetBPAnEURXmIxIBlynaUktSHJ8NHBsB7/YPd8aGr7GZzso=
X-Received: by 2002:ac8:59ca:0:b0:420:c750:c244 with SMTP id
 f10-20020ac859ca000000b00420c750c244mr1118141qtf.12.1701183705214; Tue, 28
 Nov 2023 07:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231117072131.2886406-1-khtsai@google.com> <a4a129a3-e271-acbb-949c-534a8e1627ee@linux.intel.com>
 <CAKzKK0rnx+tSFAj6N-U_vcAZ_5P=Hx_Kb97NFkdPMHs8dR3Ukw@mail.gmail.com>
 <a970f296-da67-9a80-ab2f-a94fd16e0fd9@linux.intel.com> <51b8fc3d-25ef-1ab3-d744-8d851a133828@linux.intel.com>
In-Reply-To: <51b8fc3d-25ef-1ab3-d744-8d851a133828@linux.intel.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Tue, 28 Nov 2023 23:01:17 +0800
Message-ID: <CAKzKK0r_a_8uWTxjupDwwHH9hyCUd_NNTojL=209FiEzrcK9fw@mail.gmail.com>
Subject: Re: [PATCH] xhci: fix null pointer deref for xhci_urb_enqueue
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"

Thank you so much for fixing the issue, Mathias!

> I moved the max packet checks away from xhci_urb_enqueue() and fixed up the locking.
> I can't trigger the original issue, but I tested it by setting incorrect initial max packet
> size values.

I added a 3-seconds delay within xhci_check_maxpacket(). When I saw
the max packet size was being checked, I removed the USB device to
trigger the race problem.

[  172.392813][ T1960] [khtsai] xhci_check_maxpacket, before,
slot_id=2, devs[slot_id]=000000003cb76fec
[  174.290601][   T20] usb 2-1: USB disconnect, device number 2
[  174.290608][   T20] usb 2-1.2: USB disconnect, device number 3
[  174.297180][   T20] [khtsai] xhci_free_dev, ret=1
[  174.305010][  T133] usb usb3: USB disconnect, device number 1
[  174.316346][   T20] [khtsai] xhci_free_dev, ret=1
[  175.458962][ T1960] [khtsai] xhci_check_maxpacket, after,
slot_id=2, devs[slot_id]=0000000000000000
[  175.460835][ T1960] Unable to handle kernel NULL pointer
dereference at virtual address 0000000000000010

> If you have the chance to test this with your setup I'd appreciate it.

Sure, I will definitely help verify it. However, I believe the race
problem won't happen as your patch already removes max packet checks
from xhci_urb_enqueue() and also protects sections using the
xhci->devs[slot_id] virtual device.

> patches found here:
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git fix_urb_enqueue_locking
> https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git/log/?h=fix_urb_enqueue_locking

I'll add them to this thread as well

