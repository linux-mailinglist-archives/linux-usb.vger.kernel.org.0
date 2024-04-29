Return-Path: <linux-usb+bounces-9913-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6268B5C41
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 17:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4B8C1C2155A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 15:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEF280BE3;
	Mon, 29 Apr 2024 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="MWYSOKa1";
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b="okpC09mq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.ivitera.com (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D867A15C
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.101.85.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714402953; cv=none; b=DUYqidr+1QRyUqZVFCM2v23mfyx1nYuK1ATs31iKzxrGlscDySawVTei5IFppxh0qMi3ml9bMRqU34LHb5gQQ7+tE8P4G4QvUlLoebBjCpFVrvb+NmaDK/Dy9HpFxfKW0AT4dgAyw1S8plNCUk7Cv0UQFSj+/o+O7nuCn0TyiPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714402953; c=relaxed/simple;
	bh=1j9Bh83FGSh7vkGgky5cnAkByc5G6v68ZN1HrXNV2D4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceq10RZsBRtmaR873hkpHrEhP87PTLKoBWzHeybXtaIWvRz2qIVXRzSYKTpTzqHj6KvQ6BoZuEEIjtgLURUpG3Xq/C1eLTHifs5j6X10NbQ8x5qTtGxYOmoplhu2snZMXFqXcbD9tVrV0UcL2x+m22f2oQbh3SZtMwaIQLaK6UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com; spf=pass smtp.mailfrom=ivitera.com; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=MWYSOKa1; dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com header.b=okpC09mq; arc=none smtp.client-ip=88.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ivitera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ivitera.com
Received: from localhost (localhost [127.0.0.1])
	by smtp.ivitera.com (Postfix) with ESMTP id 4F989165504;
	Mon, 29 Apr 2024 17:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714402941; bh=1j9Bh83FGSh7vkGgky5cnAkByc5G6v68ZN1HrXNV2D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWYSOKa1NSb6u3aOEBKBFeOsqq7090UxBap/wpIRKij1TWbDGGzYh8DN7gd/egvQw
	 YvarYA154vXCDk24HzdZA8xwlEq87RILc327uO2bF0irA+by7PF91XmYfhovfuVn+p
	 CmkPvh6YraKVIqeDeOvsRyPP9bfKxlJVv5ySZS0A=
Received: from smtp.ivitera.com ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ubuszyJBMD_2; Mon, 29 Apr 2024 17:02:20 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
	(Authenticated sender: pavel)
	by smtp.ivitera.com (Postfix) with ESMTPSA id 6F34B165503;
	Mon, 29 Apr 2024 17:02:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1714402940; bh=1j9Bh83FGSh7vkGgky5cnAkByc5G6v68ZN1HrXNV2D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=okpC09mqLVFXXY/4hzDL8qqdnJWDwxTD37D2I6l09578W8z9G6p9JJxrJn4ILzsqS
	 g/gAXWxI5qqxCqtdlNYCeR90+/lj4mtHj3UFZx6gVTgStMj+CBXhFRc/2lKL8czrUY
	 xBHjothsyRX/JKCWORSkBVDQz1CDt0y5AKMly2uI=
Message-ID: <0ba8963c-9b2a-f7aa-3c0f-296bdddac5e5@ivitera.com>
Date: Mon, 29 Apr 2024 17:02:19 +0200
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
To: Chris Wulff <Chris.Wulff@biamp.com>, Chris Wulff <crwulff@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, Felipe Balbi <balbi@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Julian Scheel <julian@jusst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Keeping <john@metanate.com>, AKASH KUMAR <quic_akakum@quicinc.com>,
 Jack Pham <jackp@codeaurora.org>
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com>
 <871q6tbxvf.wl-tiwai@suse.de>
 <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
 <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
 <CO1PR17MB5419D45A1BDC2AFA22F60DD9E1142@CO1PR17MB5419.namprd17.prod.outlook.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <CO1PR17MB5419D45A1BDC2AFA22F60DD9E1142@CO1PR17MB5419.namprd17.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 28. 04. 24 18:38, Chris Wulff wrote:
> Pavel,
> 
>   Following up on this and discussions in this patch series
> 
> https://lore.kernel.org/linux-usb/CO1PR17MB54195BE778868AFDFE2DCB36E1112@CO1PR17MB5419.namprd17.prod.outlook.com/
> 
> Example from that thread with c_alt_name changed to c_name as it lives
> in an "alt.x" directory and removal of the num_alt_modes in favor of just
> allowing "mkdir alt.x" to create new alt mode settings:
> 
> (all existing properties + the following new properties)
> c_it_name
> c_it_ch_name
> c_fu_name
> c_ot_name
> p_it_name
> p_it_ch_name
> p_fu_name
> p_ot_name
> 
> alt.0
>   c_name
>   p_name
> alt.1 (for alt.1, alt.2, etc.)
>   c_name
>   p_name
>   c_ssize
>   p_ssize
>   (Additional properties here for other things that are settable for each alt mode,
>    but the only one I've implemented in my prototype so far is sample size.)

Please let me a question regarding some of the proposed string configs.
Currently we have one feature unit which implements volume and mute
feature controls. IIUC more feature units can be added, with specific
controls set, as specified by the UAC. IIUC the linux USB audio driver
works with volume+mute specifically and other controls by creating
corresponding alsa ctls, Windows UAC2 driver works with AGC too
https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/usb-2-0-audio-drivers#class-requests-and-interrupt-data-messages
. That means there is a potential for adding more feature units to the
gadget.

Would it make sense to name the p/c_fu_name properties specifically
p/c_fu_volume_name, to leave name room for additional feature units?

Please what does p/c_it_ch_name stand for?

> 
> 
> Here is a more detailed breakdown of the (current) proposal:
> 
> * Allow the user to create "alt.x" directories inside uac1 and uac2
>   function configfs
>   * Prior to creation of any of these alt.x subdirectories, the
>     function behaves the same as it does today. No "alt.x" directories would
>     exist on creation of the function.
>   * Creation of "alt.0" contains only "c_name" and "p_name" to set the
>     USB string name for this alt mode, with the defaults as "Capture Inactive"
>     and "Playback Inactive"
>   * Creation of "alt.x" where x is an integer, contains the same name
>     strings but with defaults of "Capture Active" and "Playback Active" and
>     additional files for any per-alt-mode configurable settings (such as
>     c_ssize, p_ssize, etc.) At the time of creation, values for those are copied 
>     from the corresponding settings in the function main configfs directory.
>   * Creation of "alt.1" in particular changes the meaning of the files
>     in the main function configfs dir so that they are only _default_ values used
>     when creating "alt.x" directories and settings from "alt.1" will now be used
>     for alt mode 1. (Alt mode 1 always exists, even when "alt.1" has not been
>     created.)
> 
> * ALSA card interface behavior
>   * Configuration of the ALSA card interface remains the same. It is configured
>     when binding the function to match the settings in the main function configfs.
>     "alt.x" settings have no effect on the created ALSA card setup
>   * Sample size will be converted between ALSA and USB data by dropping
>     extra bits or zero padding samples (eg 16->24 will zero pad a byte, 24->16
>     will drop a byte)

Is not this work for userspace, e.g. for the plug plugin? IMO the
hw_params should reflect the requested format as is now, doing no
conversions in the gadget driver. Currently the driver just copies the
buffer from the packet area to the alsa area which is the correct way, IMO.

It also allows for future addition of FLOAT_LE format which is part of
UAC specs and which (at least) the windows and linux host drivers
support (for which I would already have a use case). Actually the linux
and windows USB audio driver supports the TYPE III digital formats.

IIUC the gadget itself does not (and should not, IMO) care much about
the actual format (apart of converting the USB format ID to the alsa
format code for hw_params).


>   * Channel count differences will ignore extra incoming channels and zero
>     outgoing extra channels (eg 8->2 will just copy the first two and ignore
>     the rest. 2->8 will copy the first two and zero the rest.)

I think it's dtto. Either alsa automatic plug plugin, or detailed with
the route plugin.

>   * Per-alt-mode configurable settings will have a read-only ALSA control (like
>     sample rate does currently) that can be used to inform the program attached
>     to the ALSA card what the current state of those settings are when the USB
>     host selects an alt mode.

The fact is that samplerate is already reported in a separate ctl. But
the main motivation for this control was not to report the rate, but to
give some indication that USB host started streaming/requesting data.
The rate ctl was actually handy to report both this change and the
actual rate.

Actually there have been submitted patches (IMO not yet included) which
report this change using uevents
https://patchwork.kernel.org/project/linux-usb/list/?series=745790&state=%2A&archive=both
. IMO a perfectly valid approach too.

Also the alsa loopback device is very similar from this POV. It reports
(via ctl notifications) that the other/master side has been opened, and
it's up to the userspace to read current hw_params to determine what
format/channels/rate to use to successfully open the device.

Maybe we could leave it to the userspace here too. In fact there are
already open-source clients which try to handle this master/slave
principle of the loopback and gadget basically in the same way
https://github.com/HEnquist/camilladsp/pull/341#issue-2267218348
https://github.com/HEnquist/camilladsp/issues/342



> 
> An simple example of how this could be used to create a second alt mode:
> 
> mkdir uac1.0
> echo 24 > uac1.0/p_ssize
> echo 24 > uac1.0/c_ssize
> mkdir uac1.0/alt.2
> echo 16 > uac1.0/alt.2/c_ssize

Currently the p/c_ssize values represent number of bytes (i.e. 1-4). IMO
it would make sense to keep this meaning here. In the future e.g.
negative numbers could be used to select some non-integer format types.

> 
> NOTE: Alt modes are separately selectable by the host for playback and capture
> so the host can pick and choose as desired. There is no need to make an alt mode
> for every combination of playback and capture settings. In this example the host
> can pick either 24 or 16 bit samples for capture, but is only allowed 24 bit samples
> for playback as both alt.1 (via uac1.0/p_ssize) and alt.2 (via default copied to
> uac1.0/alt.2/p_ssize) have been configured as 24-bit.

Are capture and playback alt modes dependent? I thought they were
separate configurations but I may be wrong.

If they are separate, perhaps p_alt.X and c_alt.X dirs would make sense
instead, with using non-prefixed properties within them (ssize, ch_mask,
etc.). I.e. p/c_xxx on the main level (setting the defaults and default
alt1 for each direction) and non-prefixed properties in the actual
p/c_alt.X subdirs.

Thanks a lot for your great effort,

Pavel.

