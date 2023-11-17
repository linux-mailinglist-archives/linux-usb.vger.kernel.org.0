Return-Path: <linux-usb+bounces-2973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E97EF803
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 20:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC4CB20976
	for <lists+linux-usb@lfdr.de>; Fri, 17 Nov 2023 19:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6671337177;
	Fri, 17 Nov 2023 19:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nkMpN941"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67B37147
	for <linux-usb@vger.kernel.org>; Fri, 17 Nov 2023 19:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918F1C433C8;
	Fri, 17 Nov 2023 19:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700250417;
	bh=/LhMOYd/JOXNFZ07PxWcoviKMP3G1QFUwtsQ6l2wVJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkMpN941PQpk3SOyyqtZfzKBpP77UWi57lCmpqAk4s1DM0uhDfgWyvbzkSo1ii5PJ
	 thwwYjHwv9sbP6v4nry2tDqhr93xGbxZJJLnD3Y9Hs7RUWCmuUI+lfExxPqH1jsc/p
	 IRPZgIg2sIy58V3DU8KJ33Bnu9Or+fV1/FSt/v3g=
Date: Fri, 17 Nov 2023 14:46:55 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Thinh Nguyen <thinh.nguyen@synopsys.com>,
	Zubin Mithra <zsm@chromium.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: set the dma max_seg_size
Message-ID: <2023111754-expand-facsimile-febe@gregkh>
References: <20231026-dwc3-v2-1-1d4fd5c3e067@chromium.org>
 <20231031232227.xkk4ju3hxifj3vee@synopsys.com>
 <CANiDSCvEyjHFT3KQbsbURjUadpQYEfQ=M8esdcHnpWe9VsK=2w@mail.gmail.com>
 <20231110225507.cl6w6vkyb4dvj3uh@synopsys.com>
 <CANiDSCu1WdKu+2Erkj9iEnp21Cuk84MC_ow+8o-qETqJH1qMNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCu1WdKu+2Erkj9iEnp21Cuk84MC_ow+8o-qETqJH1qMNg@mail.gmail.com>

On Fri, Nov 17, 2023 at 01:48:47PM +0100, Ricardo Ribalda wrote:
> Greg: Friendly ping, just want to make sure that the patch did not
> fell into the cracks

The merge window just ended, and we have been away at the plumbers
conference all week long.  Give us a chance to travel back home and
start to catch up in the next few weeks.

In the meantime, please take some time and review the pending dwc3
patches on the list to make my review process easier and allow me to get
through them all to yours quicker.

thanks,

greg k-h

