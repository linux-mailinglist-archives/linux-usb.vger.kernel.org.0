Return-Path: <linux-usb+bounces-9-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2379F4BA
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 00:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B34D1F21181
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 22:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ECE2770A;
	Wed, 13 Sep 2023 22:08:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D52AD5C
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 22:08:01 +0000 (UTC)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B4B19A0
	for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 15:08:00 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6c0c675cb03so193194a34.1
        for <linux-usb@vger.kernel.org>; Wed, 13 Sep 2023 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694642880; x=1695247680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfjhWaT9cZxBP5V6PIM2mr46ku8Oc99YcLOA60af1KU=;
        b=Wi1LCj86ApS9gpVrE9naZ3qyr3fYpgNUpZFYmAIAApZONcdoNpurdU6KjHPdWqqylw
         zVtzPHyIJwJKksnoF71UPDPQN8Zibhn6mMHHna6ZOqxWBnUBsojK8KYqxDGZ/drjWr0O
         YtkBgcUwAtsa65E2n39fFUZDBcixbSlgv1o6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694642880; x=1695247680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfjhWaT9cZxBP5V6PIM2mr46ku8Oc99YcLOA60af1KU=;
        b=aeBzsNwGMgN27iIh5LxqAV42ppdqfRUnePEZ6eyLHy8jYacH1HdzeD8uSwScFli+tb
         oclZeOAUrLzwi9QqRRsIwakwV0wsitL3Z9ujjq+gIklVQ+bi6x+ZknsgbIUwhKIKBZPm
         f5ymrJ+eGUWXuTkQIW5pwHpR9BqIXyvP7gFZt3B8baoKeepAwaeU93HLShOaNOvSDTc2
         +QmGc+g8VxyM379wNX9v4MHFvas1rhweiYY4ZCYKuzc7j/0EZNn3kgNHjqmLrdOZUz4q
         9Jto6cT9NSsUubhtRuKMOSNvClBkBlJ/QYJqCCxJo1pnd6tgKGaQlcOABtpmB77OQvfn
         adQw==
X-Gm-Message-State: AOJu0YwvwVj3qN6TIMpo3oWkIbhcbTuUO+6RV4eTwD/R8RJymB9NGX/d
	8Oh1LzXnrEV5aRpXAKpYf+YVaw==
X-Google-Smtp-Source: AGHT+IEZE3h3wTLMmi2pZgsbif5OpA7FowTFFztJjELuZ5utKxFD22kWo++unfbUiL/8y4QCIePvbQ==
X-Received: by 2002:a05:6358:4327:b0:132:d32d:d929 with SMTP id r39-20020a056358432700b00132d32dd929mr4380721rwc.20.1694642880172;
        Wed, 13 Sep 2023 15:08:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m30-20020a637d5e000000b0057411f9a516sm19425pgn.7.2023.09.13.15.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 15:07:59 -0700 (PDT)
Date: Wed, 13 Sep 2023 15:07:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Tejun Heo <tj@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Naohiro Aota <naohiro.aota@wdc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-hardening@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [PATCH 12/19] fs: convert kill_litter_super to litter_shutdown_sb
Message-ID: <202309131507.FAD836921D@keescook>
References: <20230913111013.77623-1-hch@lst.de>
 <20230913111013.77623-13-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913111013.77623-13-hch@lst.de>

On Wed, Sep 13, 2023 at 08:10:06AM -0300, Christoph Hellwig wrote:
> Replace kill_litter_super with litter_shutdown_sb, which is wired up to
> the ->shutdown_sb method.  For file systems that wrapped
> kill_litter_super, ->kill_sb is replaced with ->shutdown and ->free_sb
> methods as needed.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org> # for pstore

-- 
Kees Cook

