Return-Path: <linux-usb+bounces-4314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7C8173AC
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 15:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88BD01F23D07
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 14:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365C21D157;
	Mon, 18 Dec 2023 14:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HY+Z+6se"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE41B13FE6
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 14:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so30877455e9.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910078; x=1703514878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4tFwZXf2Irj42ckvI2oDltH+Fbux2n5rYVXFMWyRFHI=;
        b=HY+Z+6seoyq0iyMBqgFdKSc6ZwmXSksNhr4SRYsWcL8fjKldU3XMyroh32p+xHEM3t
         bxGmS+1sry2aWJLWfVvVwFyNG3PjirjqpNd2/CaWFpRNLNqUv7FclhhIs+O4/l15qUOA
         /2hhu47ZBmPxRlFfzDTlAyZwseHABpWvCBesxiUrXYY0wHXQvGiDjYVJmblwL46KZpSG
         o+GYdc/l2MhxP+b/YHTzb190gSQyBi7ySjybz6PIqvW2igzEkpC8nfxvXn5UMv+OWOxL
         b0tT88RnqJNTRw0sqsK8qHLUlKvUio+v3Lk31zpIfEB7BPXtERiPZ0lv4+6SU7YozPB7
         vkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910078; x=1703514878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4tFwZXf2Irj42ckvI2oDltH+Fbux2n5rYVXFMWyRFHI=;
        b=FGR9GtzJ/fT/rIgrHZlEPqr4ADoK9uqRalrgIBfi0qLibHnNAzTNZUSEaZgPWQxeKW
         c61R7Pno50DUYQH8tyA6r1STPzjZ1m7pYVBKuMgSimfrMOupnmgH9lC+1oWHEUIDN0TK
         +iUNJb5TAlo+zH4u2pWAlC8WwTGL2RRjsi96ET+cECp8HDbjRdjMvQlTKkuduJB8FFHb
         qKNW8r1MyNs8cP46N7GVLmub2c1Ip9N7x/YzoDqQrVOop16GVsy3xpU403cJ0LnP3+E6
         v2Vpej1ckWX11T7w0l3PQfT5mBFYW1NfZD+vI3RLTBZBDJBw+Ra9K2WEsPnj7weyGIj5
         adhQ==
X-Gm-Message-State: AOJu0Yw8LsifU2CL4m5cUGWAkmZ9OVKr32obyvqRTpE6KAopBYxAsipH
	6Z8BBhspvlcWVC2ZwxoyIsbaLg==
X-Google-Smtp-Source: AGHT+IGKZUWIRkTdwjW0E8rrqdMaYt4xJrVj49KaN2zuDm0cqmk92q2TqNR398yRDQ3Q3TSovPG8jg==
X-Received: by 2002:a7b:cc95:0:b0:405:3455:e1a3 with SMTP id p21-20020a7bcc95000000b004053455e1a3mr8324444wma.17.1702910077976;
        Mon, 18 Dec 2023 06:34:37 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:86:2ba4:6c05:7fe8? ([2001:a61:13af:fb01:86:2ba4:6c05:7fe8])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c46cc00b0040b4c59f133sm42506016wmo.1.2023.12.18.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:34:37 -0800 (PST)
Message-ID: <70822a4d-a9d9-4be4-9d1f-89e50a8a7378@suse.com>
Date: Mon, 18 Dec 2023 15:34:36 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
Content-Language: en-US
To: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
 Hiago De Franco <hiagofranco@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Francesco Dolcini
 <francesco@dolcini.it>, davem@davemloft.net, edumazet@google.com,
 hiago.franco@toradex.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 pabeni@redhat.com
References: <ccb72864-6623-4652-8ccf-700c2c68916e@suse.com>
 <CANP3RGdOT9rrBai+uuTZCo7JPyeEbh_u+vu6VD7t_Z80nfAn1Q@mail.gmail.com>
 <20231215212023.pas6tem7ekd2zcf6@hdebian>
 <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15.12.23 22:44, Maciej Żenczykowski wrote:
> On Fri, Dec 15, 2023 at 1:20 PM Hiago De Franco <hiagofranco@gmail.com> wrote:

Hi,

> Here's my recommendation.
> On the gadget side.
> Print something when the timer is armed.
> Print something when the timer fires.
> Include the timestamp.
> 
> Then try to send something (a single packet) that won't trigger a reply.

You are implicitly raising a question.
Does this bug strike if a single package is queued? The failure
case seems to be 10 or 11 packages.

	Regards
		Oliver


