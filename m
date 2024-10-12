Return-Path: <linux-usb+bounces-16112-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7134099AFC1
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 02:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74F891C21A19
	for <lists+linux-usb@lfdr.de>; Sat, 12 Oct 2024 00:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35372A92F;
	Sat, 12 Oct 2024 00:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="om34IrCf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01228F5B
	for <linux-usb@vger.kernel.org>; Sat, 12 Oct 2024 00:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728694113; cv=none; b=ZsEbGk73YCNIAsFoRxA3jWgEKeO4lVriVOOSqxlwApt+wZMyyBaHJ2IQUwicJMlerlA9uV0fk3dEBvkPnd56pGKL+/orQA6+edPg/vnMTYvjiWGsZfN9zcNf00COnexJeOEoghxf1sK6SAZ8Oap7ZJxh4nEuWde9ck763rNKlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728694113; c=relaxed/simple;
	bh=xh4p8qY2PKHhzg5Mrku4x2L2HkNZ727S8TrV5OgEXNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWjqZGCng2cch5T9UNoBzBTPnPPYG9Tx+tGqdS4m48jldt7NS1PzB8M9xR5sXbdZyMYF4BMidb29voB/6u0LzNvT6cEPBgtYYRrsUKHB0HIxaUKC+muhOdzkCupG6RZ72IYur3nnOMjqaZ42pZrYq4SaJeU7eO+yiGyC4wlBldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=om34IrCf; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6cbd00dd21cso15653776d6.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 17:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728694111; x=1729298911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dvGmZasmMz7a7rSBmjAPnt1JQnG8byZMZuMs1krQh+M=;
        b=om34IrCfXdTPB4khTXrh1Z9A40ZlkExLFvYYoDv0oeNh4x6zr+lciM7XKYoes2nzeS
         lCRXxxYbhZRQuFaxUsMzIsc3xgcasNCsGo594VcxItwa/xottMBz72gw8AI5WJw0hI1M
         Mt9DDIfKvVlyX+UVeShwEGNW+IwwqDh0TxESfyTqyggn01H4UdYfs4F6BdfoGR8f7DIS
         E6Of3mJ+W2DdWH1fhaHjOoLpK7NWIj03p1dKnyhBgPFdVmX53l8GmurlJhJH9WXgMlQO
         W5M1Hu5IMbpwI0Cp/HOITfbb/RJidwK51qeu3wbDH0AFXFkjPYAwkY7cqrwzLXXJpvFv
         4+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728694111; x=1729298911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvGmZasmMz7a7rSBmjAPnt1JQnG8byZMZuMs1krQh+M=;
        b=iP7I9Kmugt9SFlh46uYBPa2Ihxh68Uaita5GdvoRG+5nrgzuEz2uloQbv6HD6rXBJP
         YI/8gBpARFf/4zIKmjV+nP3X9WjATEpVV+WPfiVXPrKTlw7nUUxE5A12ilayy8LXmR2F
         dNRiWOsEHPxooATP6xXJ1ptvoYiF0kC0fTAW2mym0q46oQipsSzggv3ADCAxyhOdaMYX
         XEZRETJ0y87hkMjqIX5tyJuqb9ue7gJG2vzE7ukRwN82ZNAINMhGaxhLy/AzMa1ZtF6f
         QeJ47dzQwogTnBIHAet8lHIj4KTJPJEL+sIomQULwsP+QNrkcs0M0zN8RP9bIfh3dylz
         Osxw==
X-Forwarded-Encrypted: i=1; AJvYcCWhqb/rDawL6LFEhoAKQVc8zUxCAK2r7qMOs26oDpf8EzJwXRAjZRfXb1dvnNfzlckYtrTG0+s/KS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdsuvhxdy27LNh5DicnHv65OQGcCEaI8EtyDylmKdHqt8GNsoa
	1AmtMKr7/PfKjIPB51j5fylDHdIPUSVHf5tv7p8w+jbKWFe9tbZhAl5qJwNoPA==
X-Google-Smtp-Source: AGHT+IGgvlBZKyu3axvdmxAHg+jmoIsmRxYXnsc82wv3hzVuUAdS+Y54Z6nYO32W6VVwSphR4wbhwQ==
X-Received: by 2002:a05:6214:4984:b0:6cb:d583:3765 with SMTP id 6a1803df08f44-6cbf0003300mr51048116d6.1.1728694110812;
        Fri, 11 Oct 2024 17:48:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::267d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85b7597sm21004916d6.42.2024.10.11.17.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 17:48:29 -0700 (PDT)
Date: Fri, 11 Oct 2024 20:48:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: syzbot <syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sylv@sylv.io,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in usb_port_suspend
Message-ID: <b84d31a3-4353-4506-903a-04f1e1b8cbda@rowland.harvard.edu>
References: <b9ce2eb7-1770-4198-97b2-f5d7aa57c3d1@rowland.harvard.edu>
 <670947ff.050a0220.3e960.0014.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670947ff.050a0220.3e960.0014.GAE@google.com>

On Fri, Oct 11, 2024 at 08:45:03AM -0700, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
> 
> Reported-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
> Tested-by: syzbot+f342ea16c9d06d80b585@syzkaller.appspotmail.com
> 
> Tested on:
> 
> commit:         4a9fe2a8 dt-bindings: usb: dwc3-imx8mp: add compatible..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=15346f07980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4510af5d637450fb
> dashboard link: https://syzkaller.appspot.com/bug?extid=f342ea16c9d06d80b585
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=1456db27980000
> 
> Note: testing is done by a robot and is best-effort only.

Maybe the problem occurs because the hrtimer subsystem doesn't like 
timeouts set to the current moment.  Let's try changing them all to be 
in the future.

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

Index: usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/udc/dummy_hcd.c
+++ usb-devel/drivers/usb/gadget/udc/dummy_hcd.c
@@ -50,7 +50,7 @@
 #define POWER_BUDGET	500	/* in mA; use 8 for low-power port testing */
 #define POWER_BUDGET_3	900	/* in mA */
 
-#define DUMMY_TIMER_INT_NSECS	125000 /* 1 microframe */
+#define DUMMY_INT_KTIME	ns_to_ktime(125000)	 /* 1 microframe */
 
 static const char	driver_name[] = "dummy_hcd";
 static const char	driver_desc[] = "USB Host+Gadget Emulator";
@@ -1304,7 +1304,7 @@ static int dummy_urb_enqueue(
 
 	/* kick the scheduler, it'll do the rest */
 	if (!hrtimer_active(&dum_hcd->timer))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 
  done:
@@ -1326,7 +1326,8 @@ static int dummy_urb_dequeue(struct usb_
 	rc = usb_hcd_check_unlink_urb(hcd, urb, status);
 	if (!rc && dum_hcd->rh_state != DUMMY_RH_RUNNING &&
 			!list_empty(&dum_hcd->urbp_list))
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+				HRTIMER_MODE_REL_SOFT);
 
 	spin_unlock_irqrestore(&dum_hcd->dum->lock, flags);
 	return rc;
@@ -1995,8 +1996,7 @@ return_urb:
 		usb_put_dev(dum_hcd->udev);
 		dum_hcd->udev = NULL;
 	} else if (dum_hcd->rh_state == DUMMY_RH_RUNNING) {
-		/* want a 1 msec delay here */
-		hrtimer_start(&dum_hcd->timer, ns_to_ktime(DUMMY_TIMER_INT_NSECS),
+		hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
 				HRTIMER_MODE_REL_SOFT);
 	}
 
@@ -2391,7 +2391,8 @@ static int dummy_bus_resume(struct usb_h
 		dum_hcd->rh_state = DUMMY_RH_RUNNING;
 		set_link_state(dum_hcd);
 		if (!list_empty(&dum_hcd->urbp_list))
-			hrtimer_start(&dum_hcd->timer, ns_to_ktime(0), HRTIMER_MODE_REL_SOFT);
+			hrtimer_start(&dum_hcd->timer, DUMMY_INT_KTIME,
+					HRTIMER_MODE_REL_SOFT);
 		hcd->state = HC_STATE_RUNNING;
 	}
 	spin_unlock_irq(&dum_hcd->dum->lock);

