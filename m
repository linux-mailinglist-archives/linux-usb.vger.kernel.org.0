Return-Path: <linux-usb+bounces-17018-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 825919BB006
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 10:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A3211F21205
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2024 09:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A332F1AE00C;
	Mon,  4 Nov 2024 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO3QELrt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843701AC88A
	for <linux-usb@vger.kernel.org>; Mon,  4 Nov 2024 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730713399; cv=none; b=qKANVW9ftXj6lLkiZko1dee3PS/pxtl+rBYwxuJKrTmA7b9Xigg72mEl0CW5svYBVYj8hd6g6fLALpHV38DBdBCdU/Q+/c7MozJRHjvXXfpejBprCKebm482UTYRhPn9V/3b6+na24VQP1bo7/8Atees9ooPZJGNkxHpxmI22zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730713399; c=relaxed/simple;
	bh=0d/NfMB4b1QcLo9nsHOt7+HcZFqe0RM7698ATZ0IIto=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAmtp5+PHx2OUc0Y/X+OUMXRginVC124a9tpP9w7+07PvywqgUxEgczIYIBzAikxGiQxS8nIr2S9lfnY5HFHkTh0rnSMldBlqiPbN5Ukk6YgYEMunbXORIcEICnsLASeCg+dPwij+VSUmSdSQtZSjUFU0uSGhgM14qUTC1XB3xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO3QELrt; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e3f35268so4884203e87.3
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2024 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730713396; x=1731318196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfPViAgHbKoGxrTwast7r1fPYWh+BDE+c7Cew6L/kHk=;
        b=hO3QELrtoEB/BFm9p7G5uBYecT1ltCqPwMepyEisEUanThTV9b+ZdLhJnnt0TP7ZxO
         Rkfja3CSHtuE/RV8KbEU1bS2HfTETqqe++vLOeUd/LsClZSd+Rri6bgjY1/uVyxt7kIJ
         Ski7lyPXOHL4c0U4PSa/4iNAqMHGf0dRot0LRfjugf+kz8SdIj51912ukCpLKtB3PLSf
         Yu8F8G+vq9Xe2PKiRx/7gI85VochWSN9qQVNr/1yCV8u/czw40Mr33Id+sishy03GjYz
         CvUHuYdXwVKgEgZNNs3qP61lBibGlj/QzGzBtOi2ABLP8MTL9E77qtUx7+n5YvZmjeLX
         q1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730713396; x=1731318196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfPViAgHbKoGxrTwast7r1fPYWh+BDE+c7Cew6L/kHk=;
        b=LJYUDH+ytJFBaenqMZHD3PUuoRG/jE03klrMJs/sYbIifgosod+6fmiwwA/vBAKYzw
         K2zSVcVqWSrzb2pdwZq6JFgLrkIdOutXDrrX7nDhyiCBMrTqs7ktQWZ6gu58luBTpnVk
         AxyyhZsatujdbeXDkyXD5WJX8PotL3IkSaQd7/kxx25UNlFpZvExvJ3/V0GSJFlC2l6Z
         naB0JHdq1zkvmBMOdui6m2/YPZ9nPM3+uktlGexV6lgyPBmDc3kSU5+YuiRGHWO8KTUS
         rlG7rXyExkLReXhOhmJnvzbZeo9Pz27EwEs1M4UQfvG5Y/sdkn6+RUMWHzJI9HKGoNoV
         pcvg==
X-Gm-Message-State: AOJu0YyhXD3zPL0n6mPRib7VwhqxJdhi6vAb99VBa6J6+0z949Rqt0d8
	+hI8iy2hPYisLLfaijc3aOE8a3iT4DbMc1Ewy3HLSEHVj81W8ScM
X-Google-Smtp-Source: AGHT+IEJX8BxoV5BQSepEfvstiQ7F0uiOAQ4O8OH54TBEh6F5fT90KlTe4khIEXaL26s/KbMSWgLrA==
X-Received: by 2002:ac2:5187:0:b0:53d:6a13:2931 with SMTP id 2adb3069b0e04-53d6a13376bmr2591081e87.43.1730713395462;
        Mon, 04 Nov 2024 01:43:15 -0800 (PST)
Received: from foxbook (bhf124.neoplus.adsl.tpnet.pl. [83.28.95.124])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde02f7sm1611232e87.246.2024.11.04.01.43.13
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 04 Nov 2024 01:43:15 -0800 (PST)
Date: Mon, 4 Nov 2024 10:43:10 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: xhci: Fix TD invalidation under pending Set
 TR Dequeue
Message-ID: <20241104104310.4316bad9@foxbook>
In-Reply-To: <e2570c87-17c4-4d3c-af9a-ca45cd20f02f@intel.com>
References: <20241031104159.25f9ff70@foxbook>
	<20241031104401.22a80b14@foxbook>
	<e2570c87-17c4-4d3c-af9a-ca45cd20f02f@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 31 Oct 2024 15:57:16 +0200, Mathias Nyman wrote:
> On 31.10.2024 11.44, Michal Pecio wrote:
> > +			case TD_CLEARING_CACHE: /* set TR deq command completed */
> > +				td->cancel_status = TD_CLEARED;  
> 
> This should only happen if 'Set TR Deq' fails as in success cases the
> hw_deq is moved past this TD. when it fails the cache may not be
> cleared. i.e. rd is not TD_CLEARED
Thanks, that was a bug, completely unintended. I should have placed
this line elsewhere.
 
> We do have the same problem in current code, but moving it here makes
> that even harder to fix.
Right, I will no longer try to move this code at all.

> xhci_invalidate_cancelled_tds() will now also perform some extra work
> on each already cleared td that is still in the ep->cancelled_td_list
I think this shouldn't be a problem, because every call to invalidate()
is now followed by a call to giveback(), so a future invalidate() should
never seen stale cleared TDs left by a past invalidate().

> I think its clearer to run though the cancelled td list above, and
> only call xhci_invalidate_cancelled_tds() if needed.
> 
> i.e.
> 
> list_for_each_entry_safe(td, tmp_td, &ep->cancelled_td_list,
> cancelled_td_list) { switch (td->cancel_status) {
> 	case TD_CLEARING_CACHE:
> 		td->cancel_status = TD_CLEARED;
> 		break;
> 	case TD_CLEARING_CACHE_DEFERRED:
> 	case TD_DIRTY:
> 		pending_td_cancels = true;
> 		break;
> 	default:
> 		break;
> 	}
> }
> ...
> if (pending_td_cancels)
> 	xhci_invalidate_cancelled_tds(ep);
I have done something similar, but without an extra bool. Simply test
for unempty cancelled_td_list.


Regards,
Michal

