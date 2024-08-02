Return-Path: <linux-usb+bounces-12882-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5AA945AD6
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDB81B24B5B
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184AA1DAC6F;
	Fri,  2 Aug 2024 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjLhE4hh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077611DAC56
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 09:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722590490; cv=none; b=ufz1moYS89bTej9z9KLy0QpHxmLGt//E4BVmPf2MNCUPRSCSmM1lKHCw9rBLBZxos1FSn2ruMOVllxaMN33mcT05wlc91uxVKtAhG7Pq+zCa+yusQUl4oRZySUpzVFqdtiaHrzz5JVWitu5/1JEIZo1vFtoJCrcp8PSKx5iVY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722590490; c=relaxed/simple;
	bh=YAqRqbnXFWTI064iQNiJYYlZ3QJF5y2guygoANh4U88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=juB3kwy8aprjHsDKTqraxnJgJ1i2d+AB0diWomXrcp0iuA3ao4mSqN4Xo09OIkUsswnp+lYITf1TTvA6Ej6e8dp+FMUa0SI04P+uvvaBHPvNcQW7UjllJeMFgw3c1SkFv/T8C5HfUHG3g8MNC3qNwvibLyDz0pe4iIh+OPlRONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjLhE4hh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef2fbf1d14so31239921fa.1
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2024 02:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722590487; x=1723195287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1hrAdZMPIU7tfJlLl7c1zSiz3BmZU3V+jxN/m2rPCY=;
        b=KjLhE4hhgQ5rbQmNJo6hRslie0HVTLCVlxFxPwtNGXKB3xniRCHuTUkXksf4xD1r4p
         vh8+m9uZZ3UVuu7iRdu4C1VwmwXOd3Mvkxac9g83NEAwqR6R3cswzVvXAj4KpEvRf4BJ
         zLQHu05jShJOeFPFNcaVqqVL+NAaLdidX2fFVCbfZekV6aBbMRfZ1CRrJI88gOEkOvt0
         i5byIgBLUc0tBJ9mE3bS/6rolzqmREEPURL9/8NHZ3HQ1JSSLY3J4Namnltdcik3x8ru
         mWNzG3wL62K62VfBn3V3teSBvQlTJ+oeDj0XY6akINXR0koGBcBkdkI1dJIB/tN00/1X
         zyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722590487; x=1723195287;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1hrAdZMPIU7tfJlLl7c1zSiz3BmZU3V+jxN/m2rPCY=;
        b=HYCGHDU2sog9o04+axm0vmP1Tc5tA2DsIT3PL2cu8wfAHMg3wQcNr3nyFsAC8fzx5a
         QkPsmc2QpO/pTW++hAOR+/1TwFi8QrNuiE/FWFGOgvTI7rJO2WNoAd1+h9OH6/jS3BIJ
         UlzJsHEzbyoQNFD9KrXSu8E3tGNXuhvX6yM8KIFSVs6dq7ZujgGahBDiXTUVCVuQp39X
         vY5SDrCzl292PSfWQOE71s+r1GETvSIiB+TFgHhEahInezKP9WGk5KKERIDYqT3Q10v/
         GA50sapZ7J+rtrQ3mR3LzHUai4zJjHPHBN8cwPHBkKDdMM1YHnPuM7MGIFot+ewZkCkH
         G1bg==
X-Forwarded-Encrypted: i=1; AJvYcCXgF+PjB9iNfMo0g2BYiniBLIj3K87XczNAcqAYTw+umJ12bKJgieCU3WedD/CiWR5A/sqbQ1I/h+DOhLwKm3/vy5LxyYYGt23M
X-Gm-Message-State: AOJu0Yw0Q8+0IEtsrujwg/w69i/1s3w/ecDQoyIxdVOB9AWSZvVmWu7e
	6hgHEwd3XMkVLgYL22qyTJ2M03HCWM6zyhcyQ+Ai7LNzOb8R9ybxard2Wg==
X-Google-Smtp-Source: AGHT+IHOekgqvjfVIloNL7/O0MFcjAEZ7g8JEqluWnGq49T+oJSSg0D46Xe2ul+5KHEN5YiCpEjcPg==
X-Received: by 2002:a2e:30a:0:b0:2ef:2768:619d with SMTP id 38308e7fff4ca-2f15760846fmr12065261fa.5.1722590486617;
        Fri, 02 Aug 2024 02:21:26 -0700 (PDT)
Received: from foxbook (bio134.neoplus.adsl.tpnet.pl. [83.28.130.134])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f15e186347sm1116241fa.2.2024.08.02.02.21.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 02 Aug 2024 02:21:26 -0700 (PDT)
Date: Fri, 2 Aug 2024 11:21:21 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: niklas.neronin@linux.intel.com
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 19/21] usb: xhci: add 'goto' for halted endpoint check
 in handle_tx_event()
Message-ID: <20240802112121.5a552f92@foxbook>
In-Reply-To: <20240626124835.1023046-20-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

This commit has now landed in 6.11-r1 and it appears to have a side
effect of performing the halted endpoint check after every handled
event, which wasn't done before.

>+	/* update the urb's actual_length and give back to the core */
>+	if (usb_endpoint_xfer_control(&td->urb->ep->desc))
>+		process_ctrl_td(xhci, ep, ep_ring, td, ep_trb, event);
>+	else if (usb_endpoint_xfer_isoc(&td->urb->ep->desc))
>+		process_isoc_td(xhci, ep, ep_ring, td, ep_trb, event);
>+	else
>+		process_bulk_intr_td(xhci, ep, ep_ring, td, ep_trb, event);
>+
>+check_endpoint_halted:
>+	if (xhci_halted_host_endpoint(ep_ctx, trb_comp_code))
>+		xhci_handle_halted_endpoint(xhci, ep, td, EP_HARD_RESET);
> 
> 	return 0;

Since stall handling is already present in functions like finish_td() or
process_bulk_intr_td() called from the above snippet, and this change of
behavior is not documented in the changelog, I doubt if it's intended?

Regards,
Michal

