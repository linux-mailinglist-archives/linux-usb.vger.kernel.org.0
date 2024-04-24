Return-Path: <linux-usb+bounces-9702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C668B0355
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 09:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48C741F24FA8
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 07:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B759157E86;
	Wed, 24 Apr 2024 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="Thfkjmx+";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="T5hmmwo5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEEA1534E0
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 07:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713944459; cv=none; b=aOCoim7js5E5CcGoYOpzpiUzy8PPke4wl2MO0wwqIZtltFt+ocnCO0zwujHLhW9IwEArtfkzeL5olmCMkWxirAjHvgnQFtHMPxbP6oV8oIz+Q5JKuEM8Nlmxe6aN5GPJzBBjSIouwpxO4ojUUTNdtf3p5X/K+D9h86TcAKgI0i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713944459; c=relaxed/simple;
	bh=97inWSzsWvHE51aFVaCW8E4mw6h/vXMCwyqunbJMv3M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tjz3HfCe6f7gucVzOQr8ijvPQuDudSvRSN8lF9OlliCxMi76eYWphEDUzLVmf6wOuMYR/gXrXgT/CrLvEXI8l4uL18u2iJzFtQbn6nyfjsgHx5WiGYGu0gx+aF2NIdAxwI44YIaxc7ggm+/r9xqluvAVez5yjcX+XS9xNTYgBAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=Thfkjmx+; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=T5hmmwo5; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 5A7D31704EA;
	Wed, 24 Apr 2024 09:40:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713944453; bh=97inWSzsWvHE51aFVaCW8E4mw6h/vXMCwyqunbJMv3M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Thfkjmx+kwLdUkBcSPrXc8TIUHK52LOPvAGR2JepMHE2Uk+zd+zoS3vHygDXddCgy
	 dGqABwYzJ5JY7Vh+X3EAnQInqF+1S4fswKvOuBcAm2ddK9fopeXit4vX5ZLHnCOPh9
	 v9t9hynClMTjwxzEvDJNhdUl7jdhfM+ZgAI8pkgo=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sE21McawqGRA; Wed, 24 Apr 2024 09:40:52 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 8D2A41704E9;
	Wed, 24 Apr 2024 09:40:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713944452; bh=97inWSzsWvHE51aFVaCW8E4mw6h/vXMCwyqunbJMv3M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=T5hmmwo5FYOfd2MrdClwNds/RnvuKybolpau8aiTO7rUu4BE+HqiazoUPGq/uIoQh
	 0KzCRbG7eCe6Joqh2Dusm/4sFxJivyV3hjQQDbAVKUEVjCyBKZI4Yc904mpVQ5yMvp
	 rZ0r6kYZXRLAWsQKV8wL4TRvR6+kmp3sWXIWW+Fc=
Message-ID: <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
Date: Wed, 24 Apr 2024 09:40:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi
 <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>, Chris Wulff <Chris.Wulff@biamp.com>,
 Takashi Iwai <tiwai@suse.de>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
In-Reply-To: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 17. 04. 24 13:07, Pavel Hofman wrote:

> I am considering implementation of multiple altsettings to f_uac2, so
> that multiple combinations of channels and samplesizes can be offered to
> the host.
> 
> Configuration:
> --------------
> * each altsetting for each direction should define
>    * channel mask
>    * samplesize
>    * hs_bint bInterval
>    * c_sync type (for capture only)
> 
> 
> Perhaps the easiest config would be allowing lists for the existing
> parameters (like the multiple samplerates were implemented). All the
> list params would have to have the same number of items - initial check.
> First values in the list would apply to altsetting 1, second to
> altsetting 2 etc.
> 
> Or the altsetting could be some structured configfs param - please is
> there any recommended standard for structured configfs params?
> 
> 
> Should the config also adjust the list of allowed samplerates for each
> altsetting? Technically it makes sense as higher number of channels can
> decrease the max samplerate, e.g. for via a TDM interface. If so, it
> would need either the structured configuration or some "list of lists"
> format.
> 
> 
> Implementation:
> ---------------
> 
> Parameters could be turned to arrays of fixed predefined sizes, like the
> p/s_srates. E.g. 5 max. altsettings in each direction would consume only
> 4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).
> 
> Currently all descriptor structs are statically pre-allocated as there
> are only two hard-coded altsettings. IMO the descriptors specific for
> each altsetting could be allocated dynamically in a loop over all
> none-zero alsettings.
> 
> Please may I ask UAC2 gadget "stakeholders" for comments, suggestions,
> recommendations, so that my eventual initial version was in some
> generally acceptable direction?
> 

This feature has coincidentally arisen in recent commits by Chris
https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivitera.com/T/

Maybe Takashi's commits to the midi gadget could be a way
https://patchwork.kernel.org/project/alsa-devel/list/?series=769151&state=%2A&archive=both
The midi gadget allows multiple configurations now, where configs are
placed into a separate block.X configfs directory. That way the configfs
recommendation to keep one value per item is adhered to and the
configuration is nice and clean.

This method would nicely allow various samplerate lists for each
altsetting, without having to use some obscure list of lists.

The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
altsetting ID. I am not sure the dot index not starting with 0 would be
an issue.

Now the question would be what to do with the existing (and the new
params added by Chris) flat-structure parameters which apply to (the
only one) altsetting 1. Maybe they could be used as defaults for the
other altsettings for unspecified parameters?

I very much appreciate any input, thank you all in advance.

With regards,

Pavel.

