Return-Path: <linux-usb+bounces-19675-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 074CCA1A6C2
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1ACC916594F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D78F212B3D;
	Thu, 23 Jan 2025 15:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sf3lvnqI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE46212B0E
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 15:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645114; cv=none; b=HFP978ZgC6k9+aekQ/zYpYZBXtL060wfO7UTf99CcSORlHKpYgox87a8tLBPc6QFVDERbhtbB2EP/N5WcRgX2RFXJspGg7GLpg4jOSLEBG0hGzarXneF3sFJRCTtYALap4NW0q2R9HWxDouqmS6qaMlGulsAMBc111X9Pt6niQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645114; c=relaxed/simple;
	bh=9F/OaSn8fuweFCH3ladTWTaTydc93sP5hBxUQpgO0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9pkKLsWRSxC6YtsChXtj4CchJCAoos5qcATL8Ai+HSRR7uc5O6gixwUH4CcjO+OdUBdPwBJ5qwDKoroiykqQX/au58c7x1z8z/k7DYlF7weXmtV8MsqXwazpmA3TKNhEc5ey438/PQJDyWzG5lipF7Ac+4dwqmAU4we0Su+b38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sf3lvnqI; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d8ece4937fso8673726d6.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 07:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737645112; x=1738249912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=631aiENuZfGBJPCs1cywEgmvIT9kJQOpty8zcOly6Oo=;
        b=sf3lvnqIGGs1t/3jOZ0Z3bpfQclWIlKEhG43WZVATd29yl2KmcvUhPx9nA9JXMUwkX
         de6aGhYOqwcu0NhUpVHce0ujhhycYjExtsIZ5ZDz37M3B27GzFn7VnF0YxaMRCqg6hRF
         6mWclZKX9AN8XGBLwmmaCI4T6lpINTgxNlu0ZIF28Wf2MtDsjLbZsK08dpzgpKM1P2tC
         OghueD/w1FG+BR5TlvE53US6NqEEowug+L2jtBmhe510kZg39pBcd9DYDO22MMRXKv5s
         G8FlXlypu0l1qlvaWR96BCNV2NGHYRf3PPRoWVGuMC673zVJMo0L/avKsFf0y+VvLaU7
         XwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645112; x=1738249912;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=631aiENuZfGBJPCs1cywEgmvIT9kJQOpty8zcOly6Oo=;
        b=c86+CbktwBh4Z+9ucbuulpOcJi5dU5O+8zvcMRuOq2sO98ypfiDpRzr0U9Oxorcpq8
         gs6xt6svueD/31edwIBnLZJ28X+sh5pn77ooqAXqD8pcFifT5VHsCnjkiSzNi5D4VzZT
         1Q3vtMHy2PBJdqSeIqUClh0lxUWDp+8SfACTXyXHFm9BXhMPvEDDdyez9Q+gPCuiENTi
         WGG9+IX56dL8gmCkrKd27LmSSLcd4Ibxl0c7BDlG48i5SHuifWCxl1/4qXNiPERzsMOS
         AVvPL02pvee7BGNST9SSFTX514gjKzJvbyDGuD76jWoUiBEQJJiQ/DPtc+vMXOcqkfoq
         zgIg==
X-Forwarded-Encrypted: i=1; AJvYcCWoQYNp7sqSpXMvV/DtcLy9PK2IsyCwy1O6kjbbs+OWKHwPpQjN23w6+0WJxKpiMkfQ+DCvPZDOvO8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/Fa1VRy2bBhvhlulp9js/2gh0nbjPC6JFaK7qBaB/wnAbdAz
	EJLIRX8NFQnqNsyJiCZNnYLrWs2aVyzJLMbuDr8M03EbR9JiphCWCzWjSURgSQ==
X-Gm-Gg: ASbGncv+omAB9kAtiXMGiFT31xfOCIfyA+7bjlLbqFq3G5kBejWtmRKd6YZImmEzQfb
	j2NHcgsH/srW5zIgUjQ2fttbAZ4Y5iT/i9eVEbtcQu1eR4+mu4joS+xjHlVgDUuBN0N6NbTY/kD
	0oPS3laJxKFV8smssdJSXujIdtcV3QwdOfb3ic4O9JSvlvwtkMDFieMB0MpZUsYmQNVbBMAe7zC
	Vwbk5th3bXZlfgoVBMBdjjeeyT9n6d4/OUo0VoXyuD/ynJv2lyn7otanPcH29DlI0WMuS0Y2vNr
	VJUixVi+JyUNe1lFJBLRznQ=
X-Google-Smtp-Source: AGHT+IFUzFZYic8b37Oq8op4miNTXO7cwki07AlbPa1AyzBG78+xrz5qJpCoIBrPSuDV9oVi5Ns4PA==
X-Received: by 2002:a05:6214:570b:b0:6d4:25c4:e772 with SMTP id 6a1803df08f44-6e1b2251083mr497962286d6.36.1737645111911;
        Thu, 23 Jan 2025 07:11:51 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcd3859sm71567576d6.74.2025.01.23.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:11:51 -0800 (PST)
Date: Thu, 23 Jan 2025 10:11:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Petko Manolov <petkan@nucleusys.com>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	syzbot+d7e968426f644b567e31@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH net] net: usb: rtl8150: enable basic endpoint checking
Message-ID: <0a063f6a-cce7-4a78-99e4-7069e37ab3d9@rowland.harvard.edu>
References: <20250122104246.29172-1-n.zhandarovich@fintech.ru>
 <20250122124359.GA9183@bender.k.g>
 <f199387d-393b-4cb4-a215-7fd073ac32b8@fintech.ru>
 <f099be8f-0ae0-49c7-b0bc-02770d9c1210@rowland.harvard.edu>
 <20250123094930.GG4145@bender.k.g>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123094930.GG4145@bender.k.g>

On Thu, Jan 23, 2025 at 11:49:30AM +0200, Petko Manolov wrote:
> On 25-01-22 10:59:33, Alan Stern wrote:
> > On Wed, Jan 22, 2025 at 05:20:12AM -0800, Nikita Zhandarovich wrote:
> > > Hi,
> > > 
> > > On 1/22/25 04:43, Petko Manolov wrote:
> > > > On 25-01-22 02:42:46, Nikita Zhandarovich wrote:
> > > >> Syzkaller reports [1] encountering a common issue of utilizing a wrong usb
> > > >> endpoint type during URB submitting stage. This, in turn, triggers a warning
> > > >> shown below.
> > > > 
> > > > If these endpoints were of the wrong type the driver simply wouldn't work.
> > 
> > Better not to bind at all than to bind in a non-working way.  Especially when
> > we can tell by a simple check that the device isn't what the driver expects.
> > 
> > > > The proposed change in the patch doesn't do much in terms of fixing the
> > > > issue (pipe 3 != type 1) and if usb_check_bulk_endpoints() fails, the
> > > > driver will just not probe successfully.  I don't see how this is an
> > > > improvement to the current situation.
> > 
> > It fixes the issue by preventing the driver from submitting an interrupt URB
> > to a bulk endpoint or vice versa.
> 
> I always thought that once DID/VID is verified, there's no much room for that to
> happen.

Unfortunately that's not so, for two reasons.  First, the vendor may 
change the device's design without updating the Product or Device ID, 
and second, a malicious device may spoof the VID, PID, and DID values.  
(Or, as in this case, a fuzzer may try to fool the driver.)

> Alright then.  I'd recommend following Fedor Pchelkin's advise about moving
> those declarations to the beginning of probe(), though.

Agreed.

Alan Stern

