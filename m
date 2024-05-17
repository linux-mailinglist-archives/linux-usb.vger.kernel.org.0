Return-Path: <linux-usb+bounces-10312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB228C800B
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 04:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC3D3B212A7
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2024 02:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C589470;
	Fri, 17 May 2024 02:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+eIr6fo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6578F62
	for <linux-usb@vger.kernel.org>; Fri, 17 May 2024 02:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715913754; cv=none; b=JLLrnuo/hK7gp83NPGEbL6DG7zZtoP5VSOw29JUngbkl/VktHxiKu6hDRWpFvi0vuQevlogS9TN9r/zme6DRoSJDYziTScMXkTTFfj5BoiXDvxqGXwOhO/jiWwPmdmk7OqEhdT0STFlWJfgPrujMXiX4KjIWR2WTnTLRONDcnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715913754; c=relaxed/simple;
	bh=k9vt6UAu4sWr/NT1L4OfobC04mqXhcRjUlOo/xVcuQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qD/eFF0xzRd4JpLedmtN3iDk0nkzWiEBWmwVyD1y/RHcYRPJk+XmBcyjALv4fTO3ysYslSKPWh+90YcrO3Q6Thr8jzXW1bpaG5hDC/z7++uhS62j0QzU6bU54MXAt1qdm3LmwC4kYaqWHLsmIY/udvhgTG81Pu37V5xgn9g+o04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+eIr6fo; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-43dfe020675so119111cf.0
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2024 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715913752; x=1716518552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xcERYLMw1NsaQaJs4tuIW5UTi42E5XYAUPijpvCOAiQ=;
        b=o+eIr6fo4FW7jyHwQr/kasNVkU1uEVv9aI3q2w2ljcI8TKuRNwLauA5PBa3TYtUb3o
         XdnK4Z/lvCQW8qh8AhWnnSOFDbOkO1wk4HbJ2cWLuM5Ex9+f7Zy/nGjPxP/CDHcq6cJJ
         9A2rqdDtfXdaH+ls1lIs0P1K57BE6MIhd86oy5dbaRlI7Mlz67xdEaYDhbxnZZrT2mB0
         z+X7iW8ObyMVh3n1fLjShyBJocDawB1EN+K59SOE6bqmvKXAHGCPjYNMzlnrAAZquiEx
         YVDA0P3JR+YFhGBcAPmvM6k+0oibeIg72lhpeMxaI3xDRCBpDMrhAqyT/jCQjnaMRyjk
         SfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715913752; x=1716518552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcERYLMw1NsaQaJs4tuIW5UTi42E5XYAUPijpvCOAiQ=;
        b=jsg6yt/JxiMen7bGx52cg+LYTuI0Mkc3rqPZjzQy62RrbLPxYZDYVwXz53e2J9pzEk
         mK6J+pNOsEoIe4Pg7HFDo+pp+6oUcVJg5K4e6QZNYRFCPmlmZxeU4ApioWjPuIBB7Ieu
         cv/wYZ5AKOmOa/BWXCuFWiTgQq/OUhMeSZkH4IPAAkICuR1UZTaA8HvtR4GmMjA/HDJh
         JGLajrPW3QFREb03J6rDAE4VOyZZzrPN80oayZNANZLlZ+frOMY2nxRjwhTaIJPeZfi/
         cSf4ccr/SfIQ3G+C9M2rcJKVqNUUIUOM9cu8hDadGI2HCEKQ9KbLEPkyo6appwcHxR3a
         Mx4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUd04TMDs0mKoJjJpgDGRXBb366CcxkONuvhC5vE98S9IXkF5F9gWY7WMwQOoRB3tmjVvkmHIiqugZya3pWFYKRO1dDCoE9WLGp
X-Gm-Message-State: AOJu0YyMx37wVtNQlFA8owZ+HjKWWJrIhJOrNuJxwm8NKPqy+1DHWCG5
	66YbtMlDbchcKBWt/qd2Y4z8aHrHVgTTiTvEbdMPLurmYNzJ9Ks930ka+aJy2ZfjkmFGmOek64E
	lOhGXQ16fJ2nrJeY/Q5Itu7V3rO7DcgwMQlyv
X-Google-Smtp-Source: AGHT+IEh8ySbAr1EoQyBSHepFGgUmnRibTndoFVUdDhM/Nh+Klm+zT97+G+CDHxTiKHHKRocVjSF+2B0O4oJOoRrrb4=
X-Received: by 2002:a05:622a:2615:b0:439:ef72:75fb with SMTP id
 d75a77b69052e-43e44b9cd60mr1181211cf.1.1715913751805; Thu, 16 May 2024
 19:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <80a05f4a-eaae-4db1-9604-c5eed9ff594c@ideasonboard.com>
 <20231108114848.794045-1-khtsai@google.com> <d040f84a-b55e-4b1d-85c1-b6cec6554198@ideasonboard.com>
 <20231117014538.ro6bo2ho2jgl7l6s@synopsys.com> <20231117032832.6k4msq2vlp56asho@synopsys.com>
 <MN0PR12MB59538FF4FF9C753EB9264E21B7692@MN0PR12MB5953.namprd12.prod.outlook.com>
 <20240119021520.757vpt3oeig4hws2@synopsys.com> <MN0PR12MB5953C70F29987CCDF3EAC67DB77E2@MN0PR12MB5953.namprd12.prod.outlook.com>
 <MN0PR12MB59537CD8D7AD30C20B52619EB7E32@MN0PR12MB5953.namprd12.prod.outlook.com>
In-Reply-To: <MN0PR12MB59537CD8D7AD30C20B52619EB7E32@MN0PR12MB5953.namprd12.prod.outlook.com>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Fri, 17 May 2024 10:42:05 +0800
Message-ID: <CAKzKK0qrS=A5HyqrV=_WbjO8BFnDWJ1RPGu8j9sG8+DXyT88FQ@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: uvc_video: unlock before submitting a
 request to ep
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Dan Scally <dan.scally@ideasonboard.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "Simek, Michal" <michal.simek@amd.com>, 
	"Mehta, Piyush" <piyush.mehta@amd.com>, 
	"Paladugu, Siva Durga Prasad" <siva.durga.prasad.paladugu@amd.com>, "Sayyed, Mubin" <mubin.sayyed@amd.com>
Content-Type: text/plain; charset="UTF-8"

Hi Radhey Shyam,

> Thinh:  Unfortunately, i am not able to replicate failure behaviour and
> validate the below fix. Tested webcam gadget taking stream from vivid
> and then frame capture on host using yavta.
>
> @Kuen-Han Tsai: Do you have failure environment to replicate the hang?
>

Unfortunately, I don't have a failing environment to replicate the
hang. The reporter didn't provide the steps to reproduce the issue,
and all I have are kernel panic stack traces.

Regards,
Kuen-Han

