Return-Path: <linux-usb+bounces-9773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40708B24BA
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 17:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26B35B2A172
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 15:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E0F14B064;
	Thu, 25 Apr 2024 15:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="WHNiDoqF";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="Swru+N6c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C314AD23
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714057687; cv=none; b=GtIvqfMWJl5sqZKI5hOM9/kmaq3Yq3+c2+g+IIhs6ak2+xwts113wefTQMe5yuZT4dDhWgOzL5o4Mt2MsOfNnUrBQsGqVyWM9DqxkfY0jFKZeFOsGtOohoVGisPWHU4XecIVMCTWd1MdzIz4dpYf7fenN6t6B5amYjrbZUfZtV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714057687; c=relaxed/simple;
	bh=tnyt2WWQojOoK+APOa8mNTgJLLi5KF7zaEwq6pwQ3EE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0LzGj4lUTYQArQIAGLxYZlIX2WAW6yLiCsLPFxOvP8WyS17zuXKK4ZWlzCJtzKG4GWUVOpOhf5GNqkDUxVyKZqUzw+iunFaE/q/remxIdRuOo6hJWJlHBB0pcSK4ghLjqnuhZgz9NZpkXxxE4tgHDvxIp2nhcNi0e4/FqXctnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=WHNiDoqF; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=Swru+N6c; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 71D93173AF6;
	Thu, 25 Apr 2024 17:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714057676; bh=tnyt2WWQojOoK+APOa8mNTgJLLi5KF7zaEwq6pwQ3EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WHNiDoqF1xEvcSbg05RpSxwtjwjRXGqJ8LrB11W9blOnRX3Pzg9O7Sp0V6PZvYRa3
	 m3HtUdhzWi2VpeNVgmCF2SEfgGdPDQiNlqvy4ghMdvW6qT8tBVjxmOoncwgofd1O1R
	 FruiD6UF/TX2/nhxHrS0uGlgpd+wHt2efh5843p8=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eUi7BHxqOj8; Thu, 25 Apr 2024 17:07:56 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 8EB5D17375E;
	Thu, 25 Apr 2024 17:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714057675; bh=tnyt2WWQojOoK+APOa8mNTgJLLi5KF7zaEwq6pwQ3EE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Swru+N6ch4A9VEhPKgA1byhmdFfPcQVzp/PqQbjP5b5+uhvz2D1chve9vRBI3lObz
	 OhKjzgoKEB6BNAZfrpJ1Hr/jxmhA56gN4MpzL8+/ukcf4XqfmVExbYxu21e8KGg8C2
	 hPvYxpIcpnhEPgQTA25u/t86Dzve45tA9LneXprs=
Message-ID: <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
Date: Thu, 25 Apr 2024 17:07:54 +0200
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
To: Takashi Iwai <tiwai@suse.de>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi <balbi@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>, Chris Wulff <Chris.Wulff@biamp.com>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <871q6tbxvf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 25. 04. 24 11:22, Takashi Iwai wrote:
> On Wed, 24 Apr 2024 09:40:52 +0200,
> Pavel Hofman wrote:
>>
>>
>> On 17. 04. 24 13:07, Pavel Hofman wrote:
>>
>>> I am considering implementation of multiple altsettings to f_uac2, so
>>> that multiple combinations of channels and samplesizes can be offered to
>>> the host.
>>>
>>> Configuration:
>>> --------------
>>> * each altsetting for each direction should define
>>>    * channel mask
>>>    * samplesize
>>>    * hs_bint bInterval
>>>    * c_sync type (for capture only)
>>>
>>>
>>> Perhaps the easiest config would be allowing lists for the existing
>>> parameters (like the multiple samplerates were implemented). All the
>>> list params would have to have the same number of items - initial check.
>>> First values in the list would apply to altsetting 1, second to
>>> altsetting 2 etc.
>>>
>>> Or the altsetting could be some structured configfs param - please is
>>> there any recommended standard for structured configfs params?
>>>
>>>
>>> Should the config also adjust the list of allowed samplerates for each
>>> altsetting? Technically it makes sense as higher number of channels can
>>> decrease the max samplerate, e.g. for via a TDM interface. If so, it
>>> would need either the structured configuration or some "list of lists"
>>> format.
>>>
>>>
>>> Implementation:
>>> ---------------
>>>
>>> Parameters could be turned to arrays of fixed predefined sizes, like the
>>> p/s_srates. E.g. 5 max. altsettings in each direction would consume only
>>> 4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).
>>>
>>> Currently all descriptor structs are statically pre-allocated as there
>>> are only two hard-coded altsettings. IMO the descriptors specific for
>>> each altsetting could be allocated dynamically in a loop over all
>>> none-zero alsettings.
>>>
>>> Please may I ask UAC2 gadget "stakeholders" for comments, suggestions,
>>> recommendations, so that my eventual initial version was in some
>>> generally acceptable direction?
>>>
>>
>> This feature has coincidentally arisen in recent commits by Chris
>> https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivitera.com/T/
>>
>> Maybe Takashi's commits to the midi gadget could be a way
>> https://patchwork.kernel.org/project/alsa-devel/list/?series=769151&state=%2A&archive=both
>> The midi gadget allows multiple configurations now, where configs are
>> placed into a separate block.X configfs directory. That way the configfs
>> recommendation to keep one value per item is adhered to and the
>> configuration is nice and clean.
>>
>> This method would nicely allow various samplerate lists for each
>> altsetting, without having to use some obscure list of lists.
>>
>> The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
>> altsetting ID. I am not sure the dot index not starting with 0 would be
>> an issue.
>>
>> Now the question would be what to do with the existing (and the new
>> params added by Chris) flat-structure parameters which apply to (the
>> only one) altsetting 1. Maybe they could be used as defaults for the
>> other altsettings for unspecified parameters?
>>
>> I very much appreciate any input, thank you all in advance.
> 
> IMO, a softer approach would be to use subdirs for alt1+ while flat
> files are kept used for alt0.

Thanks a lot for your help. IIUC almost all existing configs for the
UAC1/2 functions apply to the "run" altsetting - altsetting 1. The
altsetting 0 is for stopping the operation, IIUC. Actually that's how
the stream stop is detected on the gadget side - transition alt1 -> alt0.

Did you perhaps mean the first "running" altsetting?


>  Alternatively, we may allow creating
> alt0, too, and the values there will win over the flat values.
> 

IIUC this would be the meaning of default configs, in case they are not
specified in the subdir. I like that as it would make the configuration
easier if not generated by some script.

Thanks,

Pavel.


