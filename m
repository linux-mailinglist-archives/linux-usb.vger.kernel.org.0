Return-Path: <linux-usb+bounces-2104-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED897D44F8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 03:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61C45B20FB9
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 01:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A26763B6;
	Tue, 24 Oct 2023 01:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VUYMLToK"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ADA5396;
	Tue, 24 Oct 2023 01:26:24 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578E8DF;
	Mon, 23 Oct 2023 18:26:23 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso3273428b3a.1;
        Mon, 23 Oct 2023 18:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698110783; x=1698715583; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=khYmW5HSxSyYHJIQOnpslfulcxoPhqkUvde/HOe75Lw=;
        b=VUYMLToKM9uHjYz7SKimL/RzylRV1ipgljXxC0nCUtUaN9yZBllKFDlYVc9GtqqKAs
         GoYPTK9Yx+GonBkR39GdBsWDica5GwP/M8sor1ngjeVmABGvzQoQsiOwI69uY/oXxuEj
         RhlO2lAgG8rYIF7axlYf+IMQGTh639h/RXhT72U/KACyFj4K6f6mntkw6w82eEdIANT1
         2E+YDzZS1506y4NlkhDZ1MCmh8pEUa8h9aLQ8/KdZxWx4O3jUkivWYDjxHsNRd9ZAjau
         nDW/iW5PxK6pIDFXFe6OMbqKhmw6pbW3GjHE0/CGBw8Z6sWuF06YZb5FTDA1DnwEYPjF
         kJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698110783; x=1698715583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=khYmW5HSxSyYHJIQOnpslfulcxoPhqkUvde/HOe75Lw=;
        b=kzSDPTMzrzjE8pT1w1/G7CILCs9rm8Yy9ovb3rabjQpiDq/kVSF8dK90un3VdxVwzd
         zAgZ8jByHITsQ7ltZetJFZ0SCWM3zj8mYeeGB8hP8G72eV4DWo0AYVUS9ZHOCDclBEkU
         kFwn846SS09PGav02rhsfrXyM7roAr6rYjf/bFMjpULczSUnoKlePWGTjawBZ9pe6ZUE
         nXY6QZ6h9ZewH9zvNv2TDoEgY4MZqFbBd0NyrQM64KLyYlW/LzvUwLCBVCsE5p5WDUsz
         NabJXcWstT1FBEoq37/uMxA0G/aubqeM6BCG+uWVlDsnrWPqnb5sF0VH0Zsk+Ka3+bk4
         puDA==
X-Gm-Message-State: AOJu0YzcfyhZ8bES0qIv0a++l0To5nkgPzXCiArzxKo/YCzI1FfttlCf
	7TulxtlWKXIevlVriE82iVo=
X-Google-Smtp-Source: AGHT+IHmz2pOCei0LCvP+yXCiEXA+LozXeqa11KLKWUosiayRK9nW0emXepI+Id3MfyJODvnT0iSIA==
X-Received: by 2002:a05:6a20:3c8d:b0:17b:65ec:776c with SMTP id b13-20020a056a203c8d00b0017b65ec776cmr1571270pzj.20.1698110782777;
        Mon, 23 Oct 2023 18:26:22 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id k3-20020aa79d03000000b006bc3e8f58besm6757110pfp.56.2023.10.23.18.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 18:26:22 -0700 (PDT)
Message-ID: <e128a24b-0c05-4fa8-a5b1-c33da33b1687@gmail.com>
Date: Mon, 23 Oct 2023 18:26:19 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] r8152: Rename RTL8152_UNPLUG to
 RTL8152_INACCESSIBLE
Content-Language: en-US
To: Douglas Anderson <dianders@chromium.org>, Jakub Kicinski
 <kuba@kernel.org>, Hayes Wang <hayeswang@realtek.com>,
 "David S . Miller" <davem@davemloft.net>
Cc: Edward Hill <ecgh@chromium.org>, Laura Nao <laura.nao@collabora.com>,
 Alan Stern <stern@rowland.harvard.edu>, Simon Horman <horms@kernel.org>,
 linux-usb@vger.kernel.org, Grant Grundler <grundler@chromium.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20231020210751.3415723-1-dianders@chromium.org>
 <20231020140655.v5.7.Iaacab4e73761e7bd9bb622b30a804c5d20bd5b4c@changeid>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20231020140655.v5.7.Iaacab4e73761e7bd9bb622b30a804c5d20bd5b4c@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/2023 2:06 PM, Douglas Anderson wrote:
> Whenever the RTL8152_UNPLUG is set that just tells the driver that all
> accesses will fail and we should just immediately bail. A future patch
> will use this same concept at a time when the driver hasn't actually
> been unplugged but is about to be reset. Rename the flag in
> preparation for the future patch.
> 
> This is a no-op change and just a search and replace.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

