Return-Path: <linux-usb+bounces-1030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F87B6795
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 13:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 73FCB1C20929
	for <lists+linux-usb@lfdr.de>; Tue,  3 Oct 2023 11:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783B921354;
	Tue,  3 Oct 2023 11:15:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5AB21111;
	Tue,  3 Oct 2023 11:15:12 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2308ECC;
	Tue,  3 Oct 2023 04:14:53 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-53447d0241eso1331316a12.3;
        Tue, 03 Oct 2023 04:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696331691; x=1696936491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YKfyhGWK50EYX6P6nsymBrzK3PdYjAuHWlw+828dds=;
        b=mRYoWCwb8IY9fI3q38Zl1kHtvDP2PDYj37b6kUemdrmMOOsF4T/AUiLmKiGty+Htu4
         u/vjVmHPaJbi+DF/X0N6yQOf4sqPgZBTdspCXSRGLH9qHpw8tabfl0S1XKPiWTC8wq7H
         qZDc3st7oDb3YMK0d2iE3qFndr98ryfeMX+/knRk61HnL0iGR42ajZEzuBKaoTXhCVNN
         euoRHtrQaWll/dvDevn0zaLNgsvnwug8rE1PI99yyr6uKG9CTklvU+IVoB7qFsfOntUO
         c996wjxL6mvx7HT/b8ZQUd7GdO/SFXl/UA91f+BFN+cUxJlkaygyna8LgEwKGfVeqG7Z
         hz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696331691; x=1696936491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YKfyhGWK50EYX6P6nsymBrzK3PdYjAuHWlw+828dds=;
        b=GnNT8tiDq9fH9Q7i0Li04KIauvDB7iXXSdylNfmn2y0h7iunkJ0Nn60n4DOocomvYo
         b3JNrd6hGCVNUlrC3xNqJ6G4mZiKHvFRrgoGLLBx/hTt5z4/6mSDgx3OIJQFjrschKB1
         je7ncnSz2SyoN0UQXH8wOzxoK/Ffmdf/tlXgjRMn0Dq73V1z7hRcMJzyOGAEHxMW3cAq
         TYd+osufO8NVkugysy/0x0XszIRw26nlxQYfI97CQl4HxjKISdjDDBQTY67n6fNJKwRn
         JSv+ohoAs8UMEx36hXS4Bvdg6JzowWpGEpqAbq5rsDEfI5jOxFZcC3VDh6q97mb7i2D+
         /sXQ==
X-Gm-Message-State: AOJu0Yy6BNPTpe4qjTYQs+SlYCFDwKIwsaKKmoxzFlYGS0pf6+xD/QfQ
	JVMSlI+w87sn8H/muy1WyRXw13NP97U4pcOAAb4=
X-Google-Smtp-Source: AGHT+IFNmgPgmDX35YnDAkO8uZYBiO9rLldccZAMLi6NZh7xwDZfCJTSRNlCKb2bNRHCmCMwStHxFg==
X-Received: by 2002:a17:906:1cd:b0:9ae:5492:640 with SMTP id 13-20020a17090601cd00b009ae54920640mr11178573ejj.32.1696331691204;
        Tue, 03 Oct 2023 04:14:51 -0700 (PDT)
Received: from primary ([213.139.52.198])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b0098e2969ed44sm881828ejo.45.2023.10.03.04.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 04:14:50 -0700 (PDT)
Date: Tue, 3 Oct 2023 07:14:47 -0400
From: Abdel Alkuor <alkuor@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: krzysztof.kozlowski+dt@linaro.org, bryan.odonoghue@linaro.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, ryan.eleceng@gmail.com,
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	Abdel Alkuor <abdelalkuor@geotab.com>
Subject: Re: [PATCH v9 07/14] USB: typec: tps6598x: Apply patch again after
 power resume
Message-ID: <ZRv3pz6E5Jc48VxL@primary>
References: <20231001081134.37101-1-alkuor@gmail.com>
 <20231001081134.37101-8-alkuor@gmail.com>
 <ZRuy1NqA/VfWbBWn@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRuy1NqA/VfWbBWn@kuha.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 03, 2023 at 09:21:08AM +0300, Heikki Krogerus wrote:
> On Sun, Oct 01, 2023 at 04:11:27AM -0400, Abdel Alkuor wrote:
> > From: Abdel Alkuor <abdelalkuor@geotab.com>
> > 
> > TPS25750 PD controller might be powered off externally at power suspend,
> > after resuming PD controller power back, apply the patch again.
> > 
> > Signed-off-by: Abdel Alkuor <abdelalkuor@geotab.com>
> 
> This one looks also like something that should be part of the patch 4.
> 
> My concern is that with these separated features you are creating points
> into the kernel git tree where TPS25750 is enabled, but it's not fully
> functional, or even broken in scenarious like this (suspend/resume).
> You can't do that unless you have some really good reason.
> 
> Since all of these add only a bit of code each, I think it would be
> better to just merge these into the initial patch that enabled
> TPS25750 - so I belive patch 4/14.
>
Makes a lot of sense. I will add part of full tps25750 support patch
> -- 
> heikki

Thanks,
Abdel

