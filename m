Return-Path: <linux-usb+bounces-3589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB78801673
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 23:36:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 120541F21076
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 22:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECE4B619C9;
	Fri,  1 Dec 2023 22:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e8SRa3kL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E43F8C7
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 22:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC895C433C7;
	Fri,  1 Dec 2023 22:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701470171;
	bh=/ziQf+5NO5Nc/kK0ZRmDFpmb94z2MpSTFLqvRnV7wes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8SRa3kLDpCQhadn6scBTbnyd1H6hNlIw09tjMaE2ZuY4lPrzglOv0o95FRZCEgkA
	 6AZy9QJ5DuWLBqweN0cXaDmJHcRyXSNJjGq8LTWw6u0FWfq4aaKnYduhdqKOn4yPsb
	 arMP5IfJbIsuHe0b44QdLqymk/aZB9Evq60y5lp0=
Date: Fri, 1 Dec 2023 22:36:07 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: Karina Yankevich <k.yankevich@omp.ru>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH v2] usb: storage: sddr55: clean up variable type
Message-ID: <2023120110-uncharted-rift-98f9@gregkh>
References: <53bc0584-51eb-8bb7-de48-ca07fccafc19@gmail.com>
 <20230227112541.14849-1-k.yankevich@omp.ru>
 <Y/yaB2A8qwgRkqVO@kroah.com>
 <a1296b9a-c27e-3b35-e256-32350fb2a83e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1296b9a-c27e-3b35-e256-32350fb2a83e@gmail.com>

On Fri, Dec 01, 2023 at 07:16:56PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
>    Sorry for the really long delay! Your reply scared off Karina
> (it was her 1st kernel patch), so I'm trying to pick this patch up
> where it was left back in February...

Note, any submitter should be able to answer questions about their
change, as remember, if I take it I am now responsible for it.  If they
do not want to respond that means they do not want to be responsible for
it, which of course means we can't accept it :(

thanks,

greg k-h

