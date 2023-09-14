Return-Path: <linux-usb+bounces-31-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8A79FE87
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 10:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD540281B13
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 08:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5600F610D;
	Thu, 14 Sep 2023 08:36:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BF81CF94
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 08:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDAEC433C7;
	Thu, 14 Sep 2023 08:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694680559;
	bh=bdTwE5gbGugqcPZdPpP2Zn0U+qeWBs2HdRmbC2Wy3ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVlEp//SSzN5nsoY+8i017CMh3oDq5Es50BEMN70bYQ256w83KOB5doqCzmfAy9nf
	 szimSkSfoKUJG9g0NUxIB62JvCoe/1auDc/SH7gzZ/yTLBi60H2wmMooYN1es5UAJC
	 zL3S9ayYiFLj7wEN7020upwUfeQZ7eE2QfKNxvWs=
Date: Thu, 14 Sep 2023 10:35:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: This list is being migrated to the new infrastructure
Message-ID: <2023091442-material-afternoon-50d6@gregkh>
References: <20230913-early-gloomily-4066a8@meerkat>
 <CAMwyc-T=33CmqabnWdG1PO-OZpDeQr9i7yfT5uhJWYiiyu+jww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMwyc-T=33CmqabnWdG1PO-OZpDeQr9i7yfT5uhJWYiiyu+jww@mail.gmail.com>

On Wed, Sep 13, 2023 at 04:48:18PM -0400, Konstantin Ryabitsev wrote:
> On Wed, 13 Sept 2023 at 16:23, Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Hello, all:
> >
> > This list is being migrated to the new vger infrastructure. This should be a
> > fully transparent process and you don't need to change anything about how you
> > participate with the list or how you receive mail.
> >
> > There will be a brief 20-minute delay with archives on lore.kernel.org. I will
> > follow up once the archive migration has been completed.
> 
> This work is now completed. I will monitor the performance to make
> sure that the new infrastructure is still successfully coping with the
> email traffic.

Wonderful, thank you so much for doing this.

greg k-h

