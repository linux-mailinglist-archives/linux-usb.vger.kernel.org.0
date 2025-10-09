Return-Path: <linux-usb+bounces-29070-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DF08DBC772F
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 07:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 68F6C3511FB
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 05:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8C8261B96;
	Thu,  9 Oct 2025 05:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgwPnMC/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829B25FA2D
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 05:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759988328; cv=none; b=o3IZSyWiGE7sbr4hIb2Hjz8l1RoGcBTc0E/LktzZmGmpDUNtdwPqdkXnB41L0XYZm9JbM+SrdFubksUYVZyL/7sIZo+V2Z9aUMlmNP+TBfSYwa8fb3mfbr1oi100DqQWBbM4l5HyrS8T6byj/cV/0xg9tVjEm/my6an+niMnhpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759988328; c=relaxed/simple;
	bh=npR5+hdrCx438MidrYA4MYFDxbFLQwa9+iFgs/BnSQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qH1Q6v/NYmQNY+imjXwNtEVWJnhYjuoI1EFo7F7TLe8OU93MrgucqGq0AiyRn9orCz3PhFauqV9plTNs3yXSVactSauQsa/lh2s91g5QNcwevbVtUEMclECCnJjzjPCSXfSV3EdBL7apPDBxBPuKB6Xnv5lRW2ttqWkClX5Pk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgwPnMC/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-794f11334adso496429b3a.3
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759988327; x=1760593127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKbCLdA0D3ZyyrFcf4HmlfoknTM5HGR4JdTF6XUV7wY=;
        b=GgwPnMC/5b7I4MiftvL4t9BJjpH5GOyIo74rEteiiesxPSVrFENSx1m83eXCLspkM7
         w7p/dXj55rMPH8icSGq1nUZS4W6wWsEGGS+j9X69BMDOE/HvZbNlDDiPX3wJgbXBU1pg
         3mz1E6auBbLHqkmvbMz8WEOcTeDtYK4zJN524dONEf18ZNprdbFrucgaf5GZ7YBRT+1e
         LATpWP3xvoWk5MI+QaeQvKhdhjuFQMhzd08g+o/AUrXPviPyH8Cas/eShcKXxNEAB8vW
         GHvtk3rNFJFR5xdzL9UX5dfhJaHPjaYFQF6fAM+1h55M5q8tsMsLMHRnfvXFfw13/z0f
         8ZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759988327; x=1760593127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKbCLdA0D3ZyyrFcf4HmlfoknTM5HGR4JdTF6XUV7wY=;
        b=xLGR84LCf/1fq7o5+oMNpItw5i8qP7mSR9NO6u6CbpgulJuC6wWGf8P16WMUQtRmCn
         oJKliCQCNK11JVd77MCJh8qyQZm1vRbpNQqiS2t5xMr36ZSQnjqjvak0+6OjXTo1eMlJ
         EGcslrAF2Xja+B1/f5KFGudvY9Hcu0k18mVD+eWj82o13bbj/nBBi/usNY4YY/XZyFmK
         XEPeUxqMcB7jQo4+O50nMPyc9L5Pcj0YqZhob0ZGOfynjfifIw91wt9n9rwu1wHVsRRM
         +XOE0/BYBKGU2GyE8QjFYheknHst2m6EQsGnajlORkPp4G3BwDtnH2Bl3e8bMpFwgSxr
         NMRw==
X-Forwarded-Encrypted: i=1; AJvYcCWFmkKQVQjllmkFIDoJFokW8CuKre00GwbJFlt/mQTmvXky+57b/ftR0HhUO8h4aqd9dJ9qalG5+fA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1MYpvG5qm4+cYqNi8jeqRy+9WlybBTcrHMCvCKqc0Wx20qprh
	RTCR5qb/sKQjswLwYFP5rVxg058sFDmJrugzByAQvTlkNdkgWb8j7jU/
X-Gm-Gg: ASbGncsY4KDNCVx1nIf/a28H6r21+wBN6K0EomDm4fbWEImQDmsUXfFaRvnZQR2xtqF
	j8mn4Bx09muO5axNmhAtI0295yxkCsOFW247B84W5K9q0GeXu26nlEHQibrlv+JV82LPRZqRhNF
	9X4W0J20SjasP4gdrmYKqdHXyTU6r8oi4Xti/kv+HdqUTwHTMQjnvz2ojpMVBEd6dHYtnVh8gZ5
	ECzM4FkP/iVR5aZRuxRpnWgI8nay1x43RYacpSDENzcZ3XLOywrtH03H+62xjQLicjOZ0xZ/rbu
	aQtkbWs+CWawPBaP6wT1pjeCRMpGpAbfks/lzzOzpy2AfI6Mo1TSCAlXzVNF86GUDc0u9V7aWVM
	zl9zH4qVu8/fF8RT/SKCuHcXuDwq5U1kfd7uXN7wQFGoB8eSIjmv8JP4gWExwSGAZdk8=
X-Google-Smtp-Source: AGHT+IHZ44y6ZFCxVyEDZOYJddPo2NG2UBmtyjURIoIIViVofpipLRjydPLmmlTTcL3OK6IoivH0yg==
X-Received: by 2002:a05:6a21:33a8:b0:32b:70a3:afea with SMTP id adf61e73a8af0-32da80da519mr8783258637.3.1759988326785;
        Wed, 08 Oct 2025 22:38:46 -0700 (PDT)
Received: from [10.0.2.15] ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51113776sm5508816a91.14.2025.10.08.22.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 22:38:46 -0700 (PDT)
Message-ID: <5fe7d13e-e608-48a7-8205-514c461a145d@gmail.com>
Date: Thu, 9 Oct 2025 11:08:40 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM write timeout
 error(-ETIMEDOUT) in lan78xx_write_raw_eeprom
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>,
 khalid@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251004040722.82882-1-bhanuseshukumar@gmail.com>
 <2025100407-devalue-overarch-afe0@gregkh>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <2025100407-devalue-overarch-afe0@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/10/25 11:21, Greg KH wrote:
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.
> 

Hi,

Sent a v2 with cc: stable tag.
v2 Link https://lore.kernel.org/all/20251009053009.5427-1-bhanuseshukumar@gmail.com/

Regards,
Bhanu Seshu Kumar Valluri



