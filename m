Return-Path: <linux-usb+bounces-4501-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D138681BC2A
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 17:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F39E1F255E6
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 16:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C597255E64;
	Thu, 21 Dec 2023 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opzlAMEe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6136094
	for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 16:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CDEC433C8;
	Thu, 21 Dec 2023 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703176750;
	bh=xs88sO1OCNA+pCEnAQ2Wnz683OUipZaMiqLEq6ukxbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=opzlAMEeQ3ceuiEfrl9F5fncUTzU2scWCDsc6Eg0u1TuFy1XOuQeEVhC4zYVY10/q
	 qtjCCLNKyrLsei8txUFx/UDz5YjNZuNgi8QdpcjKP78u7g3BheKg81lced1r2qcTG/
	 d0TifFfCuE7itHM/86wA2nAheUOrWYtzzI1IY6zTNKkY1RH2ag3z+ysv/e+VR5kGht
	 jVCuJ3jOI8o+UGQLXkEbGICeOgJDUVSQYiOrbKtWBAB75elfDY7xJFVNRRnpjDWw5f
	 HiLMDqMOhkizN6T/Ru/NaVdR1jFvlw3TKD33Yu0fstyc1oX2V446ErYQEH7LHERKsu
	 ET0Ik8gqm4h0w==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rGM4k-0002Ch-34;
	Thu, 21 Dec 2023 17:39:11 +0100
Date: Thu, 21 Dec 2023 17:39:10 +0100
From: Johan Hovold <johan@kernel.org>
To: alper ak <alperyasinak1@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: option: add Quectel EG912Y module support
Message-ID: <ZYRqLv7JBecvV7nD@hovoldconsulting.com>
References: <20230808105158.631761-1-alperyasinak1@gmail.com>
 <CAGpma=64Tw0igy8qJSGQ-t974czvJK25GkGB3=8bGCd7f6ZNEw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGpma=64Tw0igy8qJSGQ-t974czvJK25GkGB3=8bGCd7f6ZNEw@mail.gmail.com>

On Thu, Dec 21, 2023 at 07:28:36PM +0300, alper ak wrote:

> I wanted to write because there was no feedback. I thought, it might
> have been overlooked due to the busyness.

This one appears to have fallen through the cracks somehow. Sorry about
that.

Now applied.

Johan

