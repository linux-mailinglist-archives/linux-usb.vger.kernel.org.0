Return-Path: <linux-usb+bounces-3917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE5A80A797
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 16:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D3A0B20A6E
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 15:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E9631A92;
	Fri,  8 Dec 2023 15:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w0MPu8vV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 304E4FB
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 07:39:04 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d7692542beso21012877b3.3
        for <linux-usb@vger.kernel.org>; Fri, 08 Dec 2023 07:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702049943; x=1702654743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7MZJu14fY+AvBnw0S0L7ez7N1p45/8AxvVrDnnGIeVw=;
        b=w0MPu8vVbDcl24ZCtZ5wAkvwfyDJV7PUhEs4B6bzxkKzSfo34Cn9gOgedM02RWUyVC
         gf4JZjLGj7wqNYAyHjpylP2QSqVlRCIYjJ/cLaUxUi5KCZL+2Ifr3ExbGT4ZqystxvyM
         TRSHSJDZ4o/7rw4RXUADsK7Sp8ozPgH3qa1uFDTFGr5eHvbGCtCOQxF0JsfEnVo3hcOY
         uUYnPgza+tH1k1BfBjqNI1KGJreT9NBx/4STDDKAKxfTFv+vL9qLW25kScx2YdwHAqao
         BUKyJwrv9CTY5Wj6GN4dFfTLceMN+rFzRyNQzWl+s4I+Z72J+4KVD0B+rjBXDLiD3sZy
         dGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049943; x=1702654743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7MZJu14fY+AvBnw0S0L7ez7N1p45/8AxvVrDnnGIeVw=;
        b=ZZHY7d+MdKEOUWYPSZypFeMJPxO9xlXpO3OkIGfvagG45dNwNqLf4Rr81aFnz4SJor
         QpErlE9Lvf9c24Fux1CXNUFJ3nrh3rpXCxG/bx1Tz0zrqPG3zS0ElbkcsKFXMylSswIh
         Is7sB0/n/CgJpEb4Rh6q9e7a/e6U3Op41zotP65MUSBPn6Z4aLJJwkotuv489GwvOco7
         PRZByZEfR8KKo53lIFRPyuPlM+vu00AhUEK8Ey7a0sVQ03IqrxsHcIMgxV5hRzuu0brZ
         F+3Yme44SIbT19e8llHx2c+jXP/+MhUov8UNiwXeIc18WpZbr2UpjyG8RdBliP2rgXXY
         bzHg==
X-Gm-Message-State: AOJu0YxLjtCNutQL0VWpJfcXwbE9FYt9Gns1oCUDkRVE5YpWWiiu4JZH
	v26e4iHzwdFk5YDEJ6Jg6DypSkbJmiOppeI1FCTwEg==
X-Google-Smtp-Source: AGHT+IGbaNOptbzhuujTYMz8xjdNoT90V6iTzwabvFVckhGNiM9IC3bHsXvypEOAJ2pfx21kbyRVY1rhl4Vkl8cS1zk=
X-Received: by 2002:a81:520e:0:b0:5d7:8203:597a with SMTP id
 g14-20020a81520e000000b005d78203597amr131100ywb.51.1702049943395; Fri, 08 Dec
 2023 07:39:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEPPPKtEoiF-xiNm+LjCxb_Rt4c7rrUDRr7KkGE_8iJDuc+M1g@mail.gmail.com>
In-Reply-To: <CAEPPPKtEoiF-xiNm+LjCxb_Rt4c7rrUDRr7KkGE_8iJDuc+M1g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 17:38:52 +0200
Message-ID: <CAA8EJpqMEmORJYZKHKBwexBCjmA916d9_-Y+eAByFD_VFQiA=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: typec: ucsi: fix UCSI on buggy Qualcomm devices
To: Xilin Wu <wuxilin123@gmail.com>
Cc: Andy Gross <agross@kernel.org>, andersson@kernel.org, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	neil.armstrong@linaro.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Dec 2023 at 17:27, Xilin Wu <wuxilin123@gmail.com> wrote:
>
> Hi,
>
> On Wed, 25 Oct 2023 14:49, Dmitry Baryshkov wrote:
> > On sevral Qualcomm platforms (SC8180X, SM8350, SC8280XP) a call to
> > UCSI_GET_PDOS for non-PD partners will cause a firmware crash with no
> > easy way to recover from it. Since we have no easy way to determine
> > whether the partner really has PD support, shortcut UCSI_GET_PDOS on
> > such platforms. This allows us to enable UCSI support on such devices.
>
> This issue actually also exists on an SM8550 platform, specifically AYN Odin 2.
> I tested the patch on AYN Odin 2 and it also fixed the issue.

Do you have the latest firmware available? If it's true, please send a
patch adding sm8550 to the list of platforms requiring the workaround.




-- 
With best wishes
Dmitry

