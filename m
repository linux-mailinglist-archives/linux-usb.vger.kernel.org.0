Return-Path: <linux-usb+bounces-8502-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5981488EADF
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 17:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AB081C31D6B
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B52C912F360;
	Wed, 27 Mar 2024 16:13:58 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02881304BE
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556038; cv=none; b=UtKeAzznBlDq6m//UubeG6b/Stm1EH8MeZGUHff7isXc4yA/gsnESvEAiWg9dB7AQKduHbY6pHIHxBBOZJYO4OWlKaXPwhIZ+2b9Kgtlx0kCMTbVnh+zfcnJClBSwZ35Sq7dgr/zJXiwtouVWbTZJi7Iq4qrnczPg2ig/xFPkmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556038; c=relaxed/simple;
	bh=DJgc0MBO3Mx6kzWg5iG5I9DWdX0BqTgFZBh7+WPOfaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dANN5dkk1PGdJOYm2QjuGDW2wOuqQ8DK6ECtsa6WxT6mqFRpmmZogLMwzpbAYFnXKrxuLRscpJ4beBioMidDK/MPASyebSL04lN5KZHp20JvvtUVcFz7aX8YwkM+TmxuHtPnqMuet+wtLvzyqKk9zagbUAbdyY7Jc5bYM23jSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id B045514040D; Wed, 27 Mar 2024 17:06:38 +0100 (CET)
Date: Wed, 27 Mar 2024 17:06:38 +0100
From: Christian Ehrhardt <lk@c--e.de>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org, quic_prashk@quicinc.com,
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com,
	saranya.gopal@intel.com, linux-usb@vger.kernel.org
Subject: Re: [RFC PATCH] usb: typec: ucsi: ack connector change after all
 tasks finish
Message-ID: <ZgREDo9tYAmdBcUc@cae.in-ulm.de>
References: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>


Hi,

thanks for bringing this to my attention.

On Wed, Mar 27, 2024 at 12:39:04PM +0000, Diogo Ivo wrote:
> The UCSI specification mentions that when the OPM is notified by the
> PPM of an asynchronous event it should first send all the commands it
> needs to get the details of the event and only after acknowledge it by
> sending ACK_CC_CI with the Connector Change bit set, while the current
> code sends this ack immediately after scheduling all the partner_tasks.
> Move this ACK_CC_CI command to the end of all partner_tasks.

I think this is reading too much into the spec. The only thing we
really need to know about the event itself is what we get from
the initial UCSI_GET_CONNECTOR_STATUS command. I was planning to
send a change that acks the connector change directly along with this.

All of the problems that I saw in this area were due to the fact
that the connector change indicator was cleared too late and not
too early.

Moreover, it can take quite some time to handle a connector change on
one connector. This would block any progress on a different connector,
too.

> This fixes a problem with some LG Gram laptops where the PPM sometimes
> notifies the OPM with the Connector Change Indicator field set in the
> CCI after an ACK_CC_CI command is sent,causing the UCSI stack to check
> the connector status indefinitely since the EVENT_PENDING bit is already
> cleared. This causes an interrupt storm and an artificial high load on
> these platforms.

If the PPM does this for a connector change ACK_CC_CI command it is
IMHO violating the spec (unless there is a _new_ event).
When I saw this type of loops the connector change indicator was set
in response to an ACK_CC_CI command for a command (sent by a different
thread for a different connector) between clearing the EVENT_PENDING
bit and acquiring the PPM lock.

Can you test if the changes that already are in usb-linus are
sufficient to fix your issues?

      regards    Christian



