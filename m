Return-Path: <linux-usb+bounces-14981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589D97616C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 08:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7A01F214E8
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 06:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C4018B48B;
	Thu, 12 Sep 2024 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="br3BBNDd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36968188A00
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726122114; cv=none; b=pxf63rW9o92PtVc1pCfyG/hX4+3vCQPRiooXqhSPhvhslIkulofsuuu3VU8pnwo+bGEj1eyzvGp29KyLYiJV7wTq6ui3KDVhmkG36nbgkRZ6IUv1MsEEL3mmfmyV2XdnOiqVQDZE4qz6dioNyfk1tMULAzUX3dNnHPBbYcfrq7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726122114; c=relaxed/simple;
	bh=CrwR//yFSz/4I6cU+3/T4abhqdFCLi0bEC2I1F0DoHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHrX0P8C6FNlBZhqGIrZ+QGTKxYyfvBzuR1b+jDRZbrIStDSnmNzVVkUAIuS+xwJhJPTVpUSQmoEVI0XgHYyHAsJZPWsacI4fJCfYDnNXhc7muDsIeKZJN5sLXfRXDIMmWXY43MVc3Ry8c0NEb84XdUJyfVsnRDVqRbrPXj/LUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=br3BBNDd; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6da395fb97aso5022177b3.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 23:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726122111; x=1726726911; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=usfX/wz/mLaRXfuAcPGHUFxV9u21Gw4K+EicoC3EILw=;
        b=br3BBNDdH0qw1s7QU8k5VjwEi5KdXRgAr6IS3N2DWs8hCqLKA8FbVQ2JBVqxTLGHB3
         nz6NiFet6eULUB7uZHQ0lilzc0mAbGeAGiTgB9vc8c57AyBrUhd53qqSSfMKXLjnY0Qv
         hMLSOgoVqBIEQ9F19Xdfjk0CQtm/F0PDJCeKiUfyVPY3ufWnDSRp/z8K4yg+m/xoYa9d
         n2EGlDTboc0G9zabDZ4Q3gFd0DaTPR5iCBT5LNFbbrLTU5Lypq5hf7Agr9mhtco2o6dD
         WoH11hbqBpKeUW3wT42nc7m/or7I5g/l2mAqjJrJTqJbcwYUF6/BjtQksOwx4AwlSun+
         FMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726122111; x=1726726911;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=usfX/wz/mLaRXfuAcPGHUFxV9u21Gw4K+EicoC3EILw=;
        b=ZSt/oiCavSxvGTAJPc/op+LvY4vY+3AQB0kcG7M6gNlu78TepetKsMaNjtbjcBKbCp
         Z24LjAdd4pPHIF3lLB+4s3/9mx/TnfhAbuKtI8UDXHSvZQcBfWl9CLm1ma4cWG8RfAXA
         QLwRnd1YJQGo5C46chXmQ+KuxvSFx4gopG8t9Zle2RPfRpI6UjgcEXNsA3yeyB7PXuMG
         013ly6CTOCE1PMFx7R1ADaTIr/kKJqaRklflah6inlNTfPyr4ZsJu8xqsE7WJbpjXmk7
         B6dlV5OBR3G7PZ6sn2DUibc6djoCSNALlidMZ853Txh55Pi+R0yRZaG8ZSoFfD0hhCCo
         /3HA==
X-Forwarded-Encrypted: i=1; AJvYcCXeaBOEhIYXSfIax1ECTRx0OJpHThThEkg8OwRioVA2Daa35VH0fOkVbwobOQ0QyQZm3E+q8ANkPEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNNXEMmmOcWi4jhAAliVaeQ+xRpRZbg2L1ywwS0i7o1L/qG96Q
	h2tpIyY8QHCy57KKbS1v2iEa47q9PwQLVqiKikfVkJ/F8T7gm4Mvw8/21fB7B+tZxwb7PfMx4Ae
	I77j8TEF9XElXOQF+WiBVNiMBWJj4EnWo2R+7Nw==
X-Google-Smtp-Source: AGHT+IF3Z3qQ5UqavDaqrpr39FgpUHru2lLyO42gp51F97e/+37wgcOz5KTxTAPvnN2H1oLc18hy+rXT1fuivPSmYZA=
X-Received: by 2002:a05:690c:30f:b0:6d5:6719:4d80 with SMTP id
 00721157ae682-6dbb6b8f7e0mr17367037b3.31.1726122110797; Wed, 11 Sep 2024
 23:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906065853.637205-1-lk@c--e.de> <2024091156-astronomy-licorice-5569@gregkh>
 <ZuKFetxhrQY1L5fQ@cae.in-ulm.de>
In-Reply-To: <ZuKFetxhrQY1L5fQ@cae.in-ulm.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Sep 2024 09:21:39 +0300
Message-ID: <CAA8EJpp3KMkZc3pArrgLcue-GbqLQjeOZ+9XWQDL0NeJxnfR+g@mail.gmail.com>
Subject: Re: [PATCH v4] usb: typec: ucsi: Fix busy loop on ASUS VivoBooks
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Anurag Bijea <icaliberdev@gmail.com>, 
	Christian Heusel <christian@heusel.eu>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Jameson Thies <jthies@google.com>, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Sept 2024 at 09:08, Christian A. Ehrhardt <lk@c--e.de> wrote:
>
>
> Hi,
>
> On Wed, Sep 11, 2024 at 03:37:25PM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Sep 06, 2024 at 08:58:53AM +0200, Christian A. Ehrhardt wrote:
> > > If the busy indicator is set, all other fields in CCI should be
> > > clear according to the spec. However, some UCSI implementations do
> > > not follow this rule and report bogus data in CCI along with the
> > > busy indicator. Ignore the contents of CCI if the busy indicator is
> > > set.
> > >
> > > If a command timeout is hit it is possible that the EVENT_PENDING
> > > bit is cleared while connector work is still scheduled which can
> > > cause the EVENT_PENDING bit to go out of sync with scheduled connector
> > > work. Check and set the EVENT_PENDING bit on entry to
> > > ucsi_handle_connector_change() to fix this.
> > >
> > > Finally, check UCSI_CCI_BUSY before the return code of ->sync_control.
> > > This ensures that the command is cancelled even if ->sync_control
> > > returns an error (most likely -ETIMEDOUT).
> > >
> > > Reported-by: Anurag Bijea <icaliberdev@gmail.com>
> > > Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219108
> > > Bisected-by: Christian Heusel <christian@heusel.eu>
> > > Tested-by: Anurag Bijea <icaliberdev@gmail.com>
> > > Fixes: de52aca4d9d5 ("usb: typec: ucsi: Never send a lone connector change ack")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > Does not apply to my usb-next branch :(
> >
> > Can you rebase and resend this?  Or wait until -rc1 is out and rebase
> > and resend then?
>
> I sent a v5 rebased onto usb-next.

Note, it wasn't marked as v5, it didn't contain a changelog, etc.
Please consider using the `b4` tool to send patches. It automates
versioning, changelog generation, etc.

>
> Best regards,
> Christian



-- 
With best wishes
Dmitry

