Return-Path: <linux-usb+bounces-9425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FF58A81AC
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 13:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4DA285124
	for <lists+linux-usb@lfdr.de>; Wed, 17 Apr 2024 11:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B66313C818;
	Wed, 17 Apr 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="XjP6t3m2";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="ML9k2AOL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79286136674
	for <linux-usb@vger.kernel.org>; Wed, 17 Apr 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713352057; cv=none; b=RS36hqtJ84tCJmdWDdeWdUL26goZPTFiUNh0KZlw0xJryFXyfmc3mUTHZ/hgUuZSX7hnlguV+6r38Dxwbi0ego015U8G12c8nGOroQUsyX/6C5KbbntnTfm2GLoUBzedL35eQAQa7i//Bd9sYw15xcj5O5jUqLw1p7k8I4dwAU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713352057; c=relaxed/simple;
	bh=aVmVSJH9LCw6i75ybBJo26QIBPlpMqwWQh1z29w8aU8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=EBcllhVA/30tmfCb47r+SOhdHGzGuzNjS9trgr6w8OyBBaZjkGI+zc1PuN7pA/enzbHFEFYyLMiTjvTBjbKAkTJNSVIESskUBr2/fD9jo4REse73LGZK0NQ95kf3471x4B9QX2OvcGS1TXxGq5oBlGfdo5D+4TUwbK91dX5so4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=XjP6t3m2; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=ML9k2AOL; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 23F2F175D72;
	Wed, 17 Apr 2024 13:07:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713352050; bh=aVmVSJH9LCw6i75ybBJo26QIBPlpMqwWQh1z29w8aU8=;
	h=Date:From:Subject:To:Cc:From;
	b=XjP6t3m2vstj1tx5g4IcihOygD1M8A6DGQ0afUE4wAyTXYhHN4GketSTNyNLeF7JL
	 T6EWwHyaahlp4PnXgtWSo9m3v4U6Fx8b8J3PR3pQHg2tUnV3+95VkU1Yk1vw36/kf+
	 ssV0PesgytI74m1sbWHioPuRhWQZTb0ltY0jYaOQ=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzlmUOne_DuO; Wed, 17 Apr 2024 13:07:29 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 7E89C175E07;
	Wed, 17 Apr 2024 13:07:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1713352049; bh=aVmVSJH9LCw6i75ybBJo26QIBPlpMqwWQh1z29w8aU8=;
	h=Date:From:Subject:To:Cc:From;
	b=ML9k2AOLiu1OPx6cRxyDDofLAP5q5iw/Q5GFw4CzSm588pYEMTW5Vc3mbSxIDH7Pr
	 N2E5EI3jUqdaVZ9LiHLpvDyZ36PePI7yQCuZFtqp0k8Ygo5NVVRldFb0+b3ZPv+Cvw
	 UqXkyzw5DliYawqSW5HW2P0zCqUUBRQmYhJE8mHs=
Message-ID: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
Date: Wed, 17 Apr 2024 13:07:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi
 <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am considering implementation of multiple altsettings to f_uac2, so 
that multiple combinations of channels and samplesizes can be offered to 
the host.

Configuration:
--------------
* each altsetting for each direction should define
    * channel mask
    * samplesize
    * hs_bint bInterval
    * c_sync type (for capture only)


Perhaps the easiest config would be allowing lists for the existing 
parameters (like the multiple samplerates were implemented). All the 
list params would have to have the same number of items - initial check. 
First values in the list would apply to altsetting 1, second to 
altsetting 2 etc.

Or the altsetting could be some structured configfs param - please is 
there any recommended standard for structured configfs params?


Should the config also adjust the list of allowed samplerates for each 
altsetting? Technically it makes sense as higher number of channels can 
decrease the max samplerate, e.g. for via a TDM interface. If so, it 
would need either the structured configuration or some "list of lists" 
format.


Implementation:
---------------

Parameters could be turned to arrays of fixed predefined sizes, like the 
p/s_srates. E.g. 5 max. altsettings in each direction would consume only 
4 * (5-1) + 3* (5-1) = 28 extra ints (excluding the samplerates config).

Currently all descriptor structs are statically pre-allocated as there 
are only two hard-coded altsettings. IMO the descriptors specific for 
each altsetting could be allocated dynamically in a loop over all 
none-zero alsettings.

Please may I ask UAC2 gadget "stakeholders" for comments, suggestions, 
recommendations, so that my eventual initial version was in some 
generally acceptable direction?

Thanks a lot,

Pavel.

