Return-Path: <linux-usb+bounces-2295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 976CC7D9ED5
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 19:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 959301C21049
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 17:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E33339879;
	Fri, 27 Oct 2023 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuV1h/Pb"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B262F37
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 17:26:18 +0000 (UTC)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5D2B8
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:26:16 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c509d5ab43so35008491fa.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698427574; x=1699032374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/UYVHi7AWk3VwUm9qEDj9gFx8B05de2Vwc3uIctnf0=;
        b=EuV1h/PbmoZnuIVsJdQpESWhFgsGt/rLxpm0+CgyoCZPMj8tKueXdB3VF9+WsLscdk
         DzpgeKzA44jYMIEN8C7dYoM/ShXkhA80kW1EqLw8Rup/eF728BhSMg0/p4vXMzUP+dcj
         FQMtMmRehkVroxSNqRuiYqDDLmUp1nGjbbQw3Kncvt+tjQRg/teU8cEDOYoxGZH/IPqC
         uEi5qF74z8EIx52FG9CGPeP7WXWlv5rFXgBwmE33D39ykykH1SsqZpdWf5IhxJNt5zk7
         6Yv1HCzGDhkdYtIYufF74HQzgSeH06kbMAS6ZAdnyBJrVBP1gAv8EpMFfCL31zFYTx0W
         xwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698427574; x=1699032374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/UYVHi7AWk3VwUm9qEDj9gFx8B05de2Vwc3uIctnf0=;
        b=D4s6ix4YCytTlTMhRFe/qFJJUoq2qoDC3D5Bd8mjpJBIQDl8nMZ7/eLhtGbq4b0A0z
         98NCSmXIUd63dWU57mZ0Y7XLAf4tveMew/ZGGAC20e/6SXj8VJ0GEJj1DqFk31WQN5PX
         RiR3snjcwnAUwHDYozTVybRlzwbeM51fYXrV7J8CTQ/vkFbU2GKYjIV+Qogve3PTK4mG
         ITu1VlVxYy/IMbmZz0ex1WnF0x/BmAG8UfyUXvB5YkO7Pl4j/oF3XHhpiN7mcEU+DGow
         DVWj0PPYFsWexfosfx2df/Wy/f4eMtyNOk/JMGK8YPNbWO01N8MZyRj+q2fX5CEzRo5H
         wC6A==
X-Gm-Message-State: AOJu0YzB7rfGDlQMATfelFUeN3SLyHMH490aJJe76iVzQQ5XEfQVjc4Z
	jZoUUUn13vwHxtY8Gn9X1CUYrW/ii+1Gig==
X-Google-Smtp-Source: AGHT+IGv1Asb1LpR3PEFOPIPezWyWBitSHiwwfn+SAoru685fVLy5FdXMKgUofJ1ZjkiF1k9Vpt0IA==
X-Received: by 2002:a2e:a232:0:b0:2c5:1aae:400d with SMTP id i18-20020a2ea232000000b002c51aae400dmr2539656ljm.22.1698427574494;
        Fri, 27 Oct 2023 10:26:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:4c14:9c00::188? (dltml4yyyyyyyyyyyyhfy-3.rev.dnainternet.fi. [2001:14ba:4c14:9c00::188])
        by smtp.gmail.com with ESMTPSA id a21-20020a2e8315000000b002bce38190a3sm350423ljh.34.2023.10.27.10.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 10:26:14 -0700 (PDT)
Message-ID: <93f05030-9f4c-42bd-b482-8df6d24d5a41@gmail.com>
Date: Fri, 27 Oct 2023 20:26:13 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: storage: set 1.50 as the lower bcdDevice for older
 "Super Top" compatibility
Content-Language: en-US
To: Greg KH <greg@kroah.com>
Cc: Linux USB <linux-usb@vger.kernel.org>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <2023102729-spent-ninja-7e39@gregkh>
 <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
 <21c2b8ee-7753-413e-98f9-d1401edf5c73@gmail.com>
 <2023102720-emotion-overlying-9bb4@gregkh>
From: LihaSika <lihasika@gmail.com>
In-Reply-To: <2023102720-emotion-overlying-9bb4@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2023 16.53, Greg KH wrote:
> 
> Much better, thanks, the subject and changelog text are great!
> 
> But the patch is still corrupted, with tabs turned into spaces, and we
> can't apply it at all :(
> 
> Can you fix that up and resend?
> 
> thanks,
> 
> greg k-h


My apologies for the extra trouble and thank you for your patience 🙏

As a not-totally-noob I should've known better to be more thorough 😔 

To be sure, I re-created, rebuilt and re-tested the patch. Thunderbird also had to be told "mailnews.send_plaintext_flowed=false".

I'll send the fixed patch next in a separate mail, hope I got it right now!

Thank you,
Liha

