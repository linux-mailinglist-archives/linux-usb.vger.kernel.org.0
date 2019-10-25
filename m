Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBEEE48BD
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 12:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732328AbfJYKmx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 06:42:53 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43542 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394431AbfJYKmx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Oct 2019 06:42:53 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so1740076wrr.10
        for <linux-usb@vger.kernel.org>; Fri, 25 Oct 2019 03:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:mime-version:message-id:in-reply-to
         :references:user-agent:content-transfer-encoding;
        bh=BW9HOrChNvPqeSlqhew0nSz/3RdIb+BlRHw9yj12kQs=;
        b=rZNsrGJkEz6baJxIGhnfLAIuLIy66mHV8Om4QjTQAXUq9KiwT9xBWX/UDDhA6C3LHP
         X6UP4Yb9XpzrjaWBR6IxROkzQy9UGksGrn2s55vJleTpmE7OyvhjnYTtrYDZFQhHKSry
         Roo5T63x5M3YILo7Rf686yMxQdPAaQKtTpbMRr/QyLsIxijEPW12zgBcO7UGcsPQXzbq
         5XAamls/oo2NUlXRVaHiImKhFKpw8ihQ+PBr0ul0E0neYF1lCepnQUnbPSt4WqJDR8Q/
         Hlp/WxXsVA3p43e4GgJm5uhgNlbM6Jn7Xquvc4AkR7sml8etz38+45uQoNKFczDnFmvo
         p6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:mime-version:message-id
         :in-reply-to:references:user-agent:content-transfer-encoding;
        bh=BW9HOrChNvPqeSlqhew0nSz/3RdIb+BlRHw9yj12kQs=;
        b=oxaAF2LU0xBWvnbzSjjMY5SrLM9IgwqoBp+dBsRB+9cSLOdHVTIKF/gIgayWrVNm04
         0eVlEYC5HHV9h/tfdzKpshW2PGNg9sD63c/Y6K8OpDvf1Fxnzl6kjSekDfjb2YtGBira
         RfLCOB5ZfQ24S4uFq/6W5bPmws9iFAvibMzJ3lYVQ7h/HdLrJoBpr0exd3gLbUk+SzZb
         rLoxFcdbGI3G+0699Z/y73v9xV8DcNrmvHRMoa35oPheLK6DUSaBWFDwN/FTUVQzOS08
         s83P/o6ULdvfdE4V4Wx7bz+UYf26ItZnGuK49eXeS99UP7PJcI5+yPXaB7Hzu1HLml8M
         2sqQ==
X-Gm-Message-State: APjAAAX+2Ff4S0tvRJFrY2ugLnHWwhV2oOil9RozcYjsstXIOup+4DKO
        tX3Qok/TwghsBWKQyPXeuyYve6QhmRU=
X-Google-Smtp-Source: APXvYqyMvkWhYPa0FkQRBs5Mnkx3Hc2IfRfgowjw35dT0W4NL90v2jXRI3Y8BcAsWOMBWnA1kitYiQ==
X-Received: by 2002:a05:6000:18d:: with SMTP id p13mr2325133wrx.396.1572000171736;
        Fri, 25 Oct 2019 03:42:51 -0700 (PDT)
Received: from localhost ([94.73.41.211])
        by smtp.gmail.com with ESMTPSA id j14sm2189614wrj.35.2019.10.25.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2019 03:42:50 -0700 (PDT)
From:   Vicente Bergas <vicencb@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        MarcZyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] usb: dwc3: Add shutdown to =?iso-8859-1?Q?platform=5Fdriver?=
Date:   Fri, 25 Oct 2019 12:42:49 +0200
MIME-Version: 1.0
Message-ID: <7e062766-6d2c-44b3-a513-f976bda40704@gmail.com>
In-Reply-To: <87pnil2kc2.fsf@gmail.com>
References: <4d18d4f7-a00e-bd60-6361-51054eba3bca@arm.com>
 <20190817174140.6394-1-vicencb@gmail.com>
 <8d48017a-64c5-4b25-8d85-113ffcf502c9@gmail.com> <87v9uix1sv.fsf@gmail.com>
 <645526b8-bfed-4cc6-9500-1843c5fe0da9@gmail.com>
 <0edb55d4-3bad-47ac-9d29-8d994d182e67@gmail.com> <877e4wj7ly.fsf@gmail.com>
 <fcddc3d9-f36a-4b7b-be3f-ee720fbacb05@gmail.com> <87pnil2kc2.fsf@gmail.com>
User-Agent: Trojita
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Friday, October 25, 2019 12:25:17 PM CEST, Felipe Balbi wrote:
> hi,
>
> Vicente Bergas <vicencb@gmail.com> writes:
>
>> On Wednesday, October 23, 2019 8:31:21 AM CEST, Felipe Balbi wrote: ...
>
> Do you want to send it as a formal patch or shall I do it?

All yours. Thank you for reviewing and proposing this solution.

Regards,
  Vicente.

