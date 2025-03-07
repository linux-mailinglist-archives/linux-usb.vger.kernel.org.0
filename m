Return-Path: <linux-usb+bounces-21501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1846A56C65
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 16:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DCFD81663F1
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 15:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB9221D3FD;
	Fri,  7 Mar 2025 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGxR/Kkh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA65F2E822
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362274; cv=none; b=fmFxCjhPkQk+gB1Aa3qRy1ZM7DfuMpDQaTBFgNTAHe4V9BWhGPRUGXYMxWF/DU5BXZ4DAxRGlHZkZ9+37T1v9ROuiH3nm1PmZdra0Dcnb7MY1PD1oZHpr4kDpxm62S52hGtknKaCS0U9KuzsOxrdf01n+1HaMyzNREM5pKUb6Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362274; c=relaxed/simple;
	bh=TJaBvt5MSyEyREOARe6Pl9AO8dF+86UizkoC+G1AIS0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stQkXmoB7BiSsNDc5DeRYBuXLiEOu88hseA1YogRpoe8ZDXMQQyIQuSOfZHY6SjU4hgOcw1NVvEQsr42LGk2ZCT7+1HtQgdQjWhAMGXDEffy9xN7w77v9TDHbsUHN4o7DWQuwq70rmTAb5pSnmSEvylKALxyDe+myCT/atwREyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGxR/Kkh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so1764386a12.3
        for <linux-usb@vger.kernel.org>; Fri, 07 Mar 2025 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741362271; x=1741967071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkTkMs7tt5Yj/GBmq8KIe6xzxPIthwO/Bica5AM7aXw=;
        b=NGxR/Kkh5CPhq1SDYO7DdtlYhB40TPGKjJFVUzW5RwI+1M+iaC0gxvb3y5+B4e/bdW
         KYIvTZxuebWVEWPEcDfZxyeB7Ubjmqhla6YodpeSZ9t7ka+yGMdfIvylir4ztg7A5IuG
         m4/DHhgvaEaHzRAdgcFjKWFofaOf/P6LaqsMF99KJHEMmUIU48OFyVF2CWQJcpAlb2Xa
         z3Dxtu01YxUInFg30R7d4eMxS6x81l8YGQhf4aicUwNDWX7cThjTzAleTKLn+3HmQS/5
         42Bs40PWW2iAHyn31TN/5ReG+OlzM2hwAIH0zntW3rkjab1Mox/cPIuMD5WmMH7uru8r
         dIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741362271; x=1741967071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkTkMs7tt5Yj/GBmq8KIe6xzxPIthwO/Bica5AM7aXw=;
        b=HE3qMzcUh2RjDkZUJu799faGKS3qcCi+H1uV8h8ICaU7erbCyDeRz45Ovgx/WD+zUR
         lRu9SJgGvgSskn+wv1Zi9E/UWz0x8Nz3dz21Y36qv/s7GOPa+Ke0oUZCTdi+Asysrovm
         u0jwBzSkXtx9nSOK8XX9LbzMDQj3JAjVt8FEYXUgu3CDyLmK+9vOAS77h9rDZINeUhkb
         ItZm6kOy1sFvSJKVGScUReCcgsAp0M7wk8V4b3GAJirXcZlAZcJ+lSJyIdFP6135Iumg
         zUYXOOrbxhEwTYgBgF7eO0ElauomB2Bi9tJr81ncvsswSqrKhwtzSjNMeRVZvJS3odfA
         5s7A==
X-Forwarded-Encrypted: i=1; AJvYcCXSDOHxcTTsFJ3R2QPZm90+ilDTqCG2YJLsSCB8/WuIt9HSy2nJe4QFmsu9eCurqUTS62U3wmLujhk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8tUexDBw4dITtmSGFbcgFEeu/6vxY1P7cHEoVP1OrUSVDXxO
	KuyJwspmAM5IzGWRvxiWKdNu112GdaUbp283XxXOLYUPpfF5Ft1PfMgPeA==
X-Gm-Gg: ASbGncvqsXpaIvYYyBrDblWcg9GPQGs0Uten57f1zHoHV3LWnmuyklmC9h3TiFIJcRk
	+J4P8GK8ouaVgXQ9IysuJ5yct32VoJi3o75PmOXAvfSK5HAbaP2R0l9g6fxPkBAlCfrG0EZgVmF
	pNQcQf9BuRyPDepm0I9S+ao2+vT8tKxwal7SILitpKon05M2yftpk8WSskeErloJhS6Ho5CL7Wn
	s+HGT3bDlvKlwxoWtxporHlKITy9JF/EHbqW/MIbSqISIBFYO/4IuUdpx4dHA7JmhDrBRKgWtSI
	JFVsIPq+2il95uOwoC6PNGViZziDQ/N15lg9U6J/YB5qziB4ZoTjww9m6AGRJQ==
X-Google-Smtp-Source: AGHT+IGcDi3rSIcB8/QaY+sBxZTLhmXHYgBWrgVqmnyO2x/H2Zd4joZMHIc/HGG/fTBxU7YkRbPU/w==
X-Received: by 2002:a17:907:7e9c:b0:abf:4521:eb2a with SMTP id a640c23a62f3a-ac25301fff7mr484236466b.49.1741362270715;
        Fri, 07 Mar 2025 07:44:30 -0800 (PST)
Received: from foxbook (adts246.neoplus.adsl.tpnet.pl. [79.185.230.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24960553fsm204345366b.147.2025.03.07.07.44.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 07 Mar 2025 07:44:30 -0800 (PST)
Date: Fri, 7 Mar 2025 16:44:26 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 12/15] xhci: Prevent early endpoint restart when
 handling STALL errors.
Message-ID: <20250307164426.08720aca@foxbook>
In-Reply-To: <1c369ecc-a935-4c3e-ba8a-80e7d8894a92@linux.intel.com>
References: <20250307075429.5f9d1d4e@foxbook>
	<1c369ecc-a935-4c3e-ba8a-80e7d8894a92@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Mar 2025 16:23:17 +0200, Mathias Nyman wrote:
> > Any flag added to this list needs to be added to xhci_urb_dequeue()
> > too so it knowns that the endpoint is held in Stopped state and
> > URBs can be unlinked without trying to stop it again.  
> 
> In this case it's intentional.
> 
> If we prevent xhci_urb_dequeue() from queuing a stop endpoint command
> due to a flag, then we must make sure the cancelled URB is given back
> in the same place we clear the flag, like we do in the command
> completion handlers that clear EP_HALTED and SET_DEQ_PENDING.

I'm not sure why this would be, what's the problem with the approach
used for EP_CLEARING_TT currently? And if there is a problem, doesn't
EP_CLEARING_TT also have this problem?

In this case, xhci_urb_dequeue() simply takes xhci->lock and calls:

void xhci_process_cancelled_tds(struct xhci_virt_ep *ep)
{
        xhci_invalidate_cancelled_tds(ep);
        xhci_giveback_invalidated_tds(ep);
}

Unlinked URBs are either given back instantly, or Set TR Dequeue is
queued (and flagged on ep->ep_state) and the rest of the process goes
same way as usual when called from xhci_handle_cmd_stop_ep(). 

The EP will be restarted when the last flag is cleared, which may be
either SET_DEQ_PENDING or EP_CLEARING_TT/EP_STALLED.

It's practically an optimization which eliminates the dummy Stop EP
command from the process. I thought EP_STALLED could use it.

> The EP_STALLED flag is cleared after a ClearFeature(ENDPOINT_HALT)
> control transfer request is (successfully?) sent to the device.
> If we only give back those cancelled URBs after this then we create a
> situation where cancelled urb giveback is blocked and depend on the
> completion of another transfer on a different endpoint.
> I don't want this dependency.

No doubt, that would be unbounded latency and asking for trouble.

> It's possible that this could create some type of deadlock where
> class driver ends up waiting for cancelled URBs to be given back
> before it sends the request to clear the halt, and  xhci won't give
> back the cancelld URBs before the ClearFeature(ENDPOINT_HALT) request
> completes..
> 
> Lets look at the cases where xhci_urb_dequeue() is called between
> setting and clearing this new EP_STALLED flag.
> 
> The EP_HALTED is set during same spinlock as EP_STALLED, so urbs
> dequeued during this time will be added to cancelled list, and given
> back in xhci_handle_cmd_reset_ep() completion handler where also
> EP_HALTED is cleared. If dequeue needs to be moved then
> SET_DEQ_PENDING is set, and cancelled urbs will be given back in
> xhci_handle_cmd_set_deq() completion handler.
> 
> At this stage we know endpoint is in stopped state. and will remauin
> so until EP_STALLED is cleared. if xhci_urb_dequeue() is called now
> then a stop endpoint command will ne queued, it will complete with a
> context state error due to endpoint already being stopped, but URB
> will be given back in one of the completion handlers. mentioned
> before.

Yes, it works, but in this case the "shortcut" will also work.

One problems with pointless Stop EP commands I remember is that there
is code in xhci-hub.c:xhci_stop_device() which avoids queuing Stop EP
on stopped endpoints, supposedly because it triggers some HW bug.

So the idea of these Stop EP patches was to eliminate such cases. It
also simplifies the completion handler and avoids needing:

> We could improve this codepath a bit by adding:
> [...]


Michal

