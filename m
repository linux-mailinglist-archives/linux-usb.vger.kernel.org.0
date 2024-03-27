Return-Path: <linux-usb+bounces-8483-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB67088E807
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14BA71C2F86D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F36013A269;
	Wed, 27 Mar 2024 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="d6IDrSbw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26BC2C6B6
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 14:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711550251; cv=none; b=lfKOyGxpw6sNdOsNCILKv6vtw+zT7MM9PVcL56oHbBxvpD/yZv4IK745tZjq/Q0ytbU+PJeJ/sNhU78x9/xb7qCNoADC61yakgc+LBIahCV3RC2dXpJYq2qE4dBS0rOLtgXSs/Dk3ooMh+OKGhAZyBHhjHpdidNtSMKBOHA7uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711550251; c=relaxed/simple;
	bh=Qacwg/aPlbmtgueCQFnu+mfuSjfyw9zaAGOCzNUQjFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cf48P+OkbG3HLYW2Uckxcw5ZagUGe8A/1dWg3Uw4hT1QFezxJQaRxCjSMygGnai7IiGQPfiYsaaazNYqJwH1IaotFfVfIPzTVIIm00Ypsa4ahLrSRwY765quWxTX5ZFBJQSKACS9/NTg48ZRdBy6t0GlELwQnezAhFKAOujqrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=d6IDrSbw; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D6A9B6008801;
	Wed, 27 Mar 2024 14:37:25 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id V-Ac3SujJE_X; Wed, 27 Mar 2024 14:37:23 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 345A26008800;
	Wed, 27 Mar 2024 14:37:23 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1711550243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yfYgzSxordwZnNSYlvQrGHOuka953EpZ8ms6hbDJtAE=;
	b=d6IDrSbwMQK9aVlBMN4H8MGRxr/n7ix1mYh+H3+uEx/zBEeZ8Y/WUkQ6KRR0jB6798BMhr
	vRF2J0uSXDDCtzhVbmPhcfb6Gt5fohQBI1OmimOdwbdvqMdIAaTK7K06p3S6uEczqrGJPB
	c4Z2wsFLBFrqMWPLEvctaI4OV7vs76k=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 490A8360085;
	Wed, 27 Mar 2024 14:37:22 +0000 (WET)
Date: Wed, 27 Mar 2024 14:37:18 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, quic_prashk@quicinc.com, fabrice.gasnier@foss.st.com, 
	saranya.gopal@intel.com, lk@c--e.de, linux-usb@vger.kernel.org, 
	diogo.ivo@tecnico.ulisboa.pt
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <ppfk427eddyyh6okivn7s47bhtynxgv4z4nwbvtrifwtcoeptc@27pgwyi6vjz3>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
 <CAA8EJpo8rppXZm+-nKMG1LS0V+HCz3g1ajZVY2TmedRnZ9C3JA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpo8rppXZm+-nKMG1LS0V+HCz3g1ajZVY2TmedRnZ9C3JA@mail.gmail.com>

On Wed, Mar 27, 2024 at 03:06:28PM +0200, Dmitry Baryshkov wrote:
> On Wed, 27 Mar 2024 at 14:39, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt> wrote:
> >
> > The UCSI specification mentions that when the OPM is notified by the
> > PPM of an asynchronous event it should first send all the commands it
> > needs to get the details of the event and only after acknowledge it by
> > sending ACK_CC_CI with the Connector Change bit set, while the current
> > code sends this ack immediately after scheduling all the partner_tasks.
> > Move this ACK_CC_CI command to the end of all partner_tasks.
> >
> > This fixes a problem with some LG Gram laptops where the PPM sometimes
> > notifies the OPM with the Connector Change Indicator field set in the
> > CCI after an ACK_CC_CI command is sent, causing the UCSI stack to check
> > the connector status indefinitely since the EVENT_PENDING bit is already
> > cleared. This causes an interrupt storm and an artificial high load on
> > these platforms.
> >
> > It would also be interesting to see if we could take this approach and
> > implement the discussion in [1] regarding sending an ACK_CC_CI command
> > that acks both the command completion and the connector change.
> >
> > Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> >
> > [1]: https://lore.kernel.org/all/20240320073927.1641788-1-lk@c--e.de/
> 
> We had similar issue, see
> https://lore.kernel.org/linux-arm-msm/20240313-qcom-ucsi-fixes-v1-1-74d90cb48a00@linaro.org/

Hi Dmitry,

I had seen that patch and applied it to see if it fixed the problem but
unfortunately it doesn't. The problem I am seeing is that during the
various partner_tasks the CCI sometimes comes back with the Connector
Change Indicator set after an ACK_CC_CI to ack the commands, for which
the patch you mentioned cannot have an effect.

Besides, there is the question of spec compliance. From my interpretation
of page 14 of the 1.0 spec:

"Once the OPM is notified of either a command completion and/or an
asynchronous event it shall:

1. Read the CCI and optionally the STATUS Data Structures
2. If this was an asynchronous event then it shall send any other commands
it needs to get details on the asynchronous event.
3. Acknowledge the notification via the ACK_CC_CI (Acknowledge Command
Completion and/or Change Indication) command. The only notification that is
not acknowledge by the OPM is the command completion notification for the
ACK_CC_CI or the PPM_RESET command."

we first need to send the commands and only after ACK_CC_CI the connector
change which would be addressed by my proposed change, but please let me
know your thoughts on this/if this makes sense.

Best regards,

Diogo

