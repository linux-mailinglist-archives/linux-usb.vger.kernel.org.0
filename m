Return-Path: <linux-usb+bounces-18763-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F69FB994
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 06:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3F7E1884DCA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 05:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4E614EC4E;
	Tue, 24 Dec 2024 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u+iB5Fb7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E1219FF;
	Tue, 24 Dec 2024 05:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735019575; cv=none; b=rKgP+FR/1weIJ8ePf9o466TLM1pxvfROUa2S+M4KhmKMPB4F/pnfDJdUPAIwOIqTbrJHYB6+Um668gqa5rjlKrH/X/GSAlsTvlBOWP9O3Z/k2LrvyncTbeHIcUdZ0EToTseVl2Dn7EwK7xU710OY4k5KL6/smoBVVrm+dxIf71k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735019575; c=relaxed/simple;
	bh=IWmYgd/YvMvUfGgXSHLfJu4ZVEUtW+LqTeETfJCLR7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp2jm0erfVqinczucn2ugzS7t7iY2U5HJhlNFHgXtc+eQk19TVHrbQVriwE7rp5yTxidSJxFqcLWWPobXsm2hUhxP2AMTKezwwRjs/bhwSckej+mxDna6ogUSEKucGUnvgklZTClR28fQe6uBais1KNCfcCOfqLnXKhQLFEmCBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u+iB5Fb7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62891C4CED0;
	Tue, 24 Dec 2024 05:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735019574;
	bh=IWmYgd/YvMvUfGgXSHLfJu4ZVEUtW+LqTeETfJCLR7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+iB5Fb7DaitrcB8pdmAIyM7UFGj3eD6nQDU16OQ70W40vLhZo3UvX2bD7rUI9AYY
	 WKGYXzCR+2lNfzjZzzfCYeJmuk8bfJ52xDBRIBM8GTlAKHJT490eQH1qnisNB6jsJw
	 7Ujxly6Yzlg31u3lgboBcFC0J7KCjWfA689lL2s4=
Date: Tue, 24 Dec 2024 06:52:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gordon - <gordon.xwj@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	trivial@kernel.org
Subject: Re: [PATCH] Update USB/IP OP_REP_IMPORT documentation.
Message-ID: <2024122456-verse-giblet-9870@gregkh>
References: <20241223090417.12614-1-gordon.xwj@gmail.com>
 <42623280-d7da-4bc9-98a5-65de33d4f6dc@linuxfoundation.org>
 <CAD2T5m-kZAqeR3fSXHVDtevLkU0FynriwM+tb==eYaNXvVhb=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD2T5m-kZAqeR3fSXHVDtevLkU0FynriwM+tb==eYaNXvVhb=g@mail.gmail.com>

On Tue, Dec 24, 2024 at 11:00:38AM +0800, Gordon - wrote:
> On Tue, Dec 24, 2024 at 1:11 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
> >
> > On 12/23/24 02:04, Gordon Ou wrote:
> > > Corrects byte offsets for OP_REP_IMPORT.
> >
> > Add more information on why this change is needed.
> >
> 
> The change is needed to correct the mistaken byte offset of the field
> bDeviceClass in OP_REP_IMPORT documentation. The previous field bcdDevice
> has length 2 and the offset for bDeviceClass should be 0x138 + 2 = 0x13A
> instead of 0x139. Offsets for subsequent fields are also affected and fixed
> in this patch.

Great, please include that in the changelog text when you resend this.

thanks,

greg k-h

