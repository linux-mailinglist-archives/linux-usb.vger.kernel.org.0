Return-Path: <linux-usb+bounces-9867-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F39968B4C60
	for <lists+linux-usb@lfdr.de>; Sun, 28 Apr 2024 17:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8531F21385
	for <lists+linux-usb@lfdr.de>; Sun, 28 Apr 2024 15:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40B26EB5D;
	Sun, 28 Apr 2024 15:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbZ3KTOd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E46E616
	for <linux-usb@vger.kernel.org>; Sun, 28 Apr 2024 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714318263; cv=none; b=mg8pLFgxMsi2OYWWMLZ8uVDARcNAv4zK/9L2XJIZRBB+V2zrF4cdmxyih6hiQ/aMWLnndED5IDi61y/Ypw8oxkBG6teyRfVnzhiVtzFAuJ0VxFBV7WbOCTHfEotY1oob6nwCBsPWfeLDJd8HeIf7yQyixPFUo2uKlxVRtfxZLD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714318263; c=relaxed/simple;
	bh=lAdyF9C/e2KNbvsWr1J5VmDP7l6N1dbBgMqOcKbi7EE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMFytpVx/Tl8cI9+ApExqBfblgRrc/3Xye4G8y/V1xXMNzOs88KdHzDLH+DwMUxqq98DEga7GMMKHIR0tFBWvTD3vIw5FR7FyhYYCrID3MEm1nkxVqlRmVVDICwiv+QNPoih0aWSkKO6qxjKRXfIN/VKclyS75eJMnxI1s0bDE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbZ3KTOd; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-34c90082dd7so1258968f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 28 Apr 2024 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714318259; x=1714923059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMTV3xU4yc9K0nQyO0gVgRVc9t4un6W7+V1vXXeKhGQ=;
        b=MbZ3KTOdiW78AMvYB3irWJ2uk2ocK+CAK0T+K2uExKaIRI8weNY3xvB8rzijHiLwjo
         M0SMKSpsf2KAN1+rcNas+wDYIs3TwPUjhmFKTDE8QYvF45Lk2OGLU7cMDFnVPk7tNHkj
         jHUEigVOu5lXAMDZhbpe/5MViOlAZQVc4PBO2IjLk7arzW8uQ7rp2di5jTEdbaWW+OqF
         FLq7RBITu5J3hEV6vLmYgtxlxEMIRhYTYexCF3NCjymWDgGiqyH4IXczoKYJGs5Ui7KT
         KiWGFJZz0I4UqCiS1ybSp+N7YK9sOpkOdF3o2XEZoEfDZHz3vBAuSFZ7wckXHtof/P6l
         BYNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714318259; x=1714923059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMTV3xU4yc9K0nQyO0gVgRVc9t4un6W7+V1vXXeKhGQ=;
        b=EPZL1CXxo+Tr8y+WLRbPJCKd3mAqn0XxTNfutc1rF4c4UK9kAPSFPpz10CQQZzdXte
         cJRf7IZe2ApCP7kntsXnCzqU5zyOV6mIfnxFKXJleAnakddn4UluGxPEqR7GFzpRkRNo
         XvG7WA/FSxCyDzxmwlLz/I5PV7xFurJdahBEZS6BCJzVNj0UwWjtLGeEWOlg6jG/oXQ6
         nAw/vtqAkRjpxDm/3rLYsGRc9U3WMMwm2xcC9v2AxsqAKKr3uHYWnac+r6NUDx+oZkyI
         VcKl/t0vJv9xEDmUZ7vanZLFpsXRiRsxG5AL68mu4rDPgJaiZElzrrb7ANOXjE3kHREm
         Mb3w==
X-Forwarded-Encrypted: i=1; AJvYcCX4rJ8I3kePdOFVu2sO0xQauT+UX3atGGkdQfmDU9qkBmZqIQnFyNvCLjOh5yFw6ZN4L+s7/OnNqiPILSgmjtNg7Ya/ycVhZHxk
X-Gm-Message-State: AOJu0Yy2JO7OJDU+dQ0arEZhhjpM/uQ49V7FVcCZBhXoNG/32Ro4PsNh
	PpGDe8G64Cedx93Pc9zssXoEUANdlGD9NhLuZSnlMO0wAbwieaAY64UG6awT03YOAjc9vFtXrbF
	21yl+C7vw5Th88v3o6P/CiJYC51M=
X-Google-Smtp-Source: AGHT+IEyoLOE3V4IavblSRhUH7RhbYCfLdBTOhqWHPaaskMcMrE+AMmS0fRAnMEx9Col2XGiO/CIf5mQykbSHlnuAiI=
X-Received: by 2002:a05:6000:11d0:b0:34d:118f:21ee with SMTP id
 i16-20020a05600011d000b0034d118f21eemr327836wrx.28.1714318259281; Sun, 28 Apr
 2024 08:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <35be4668-58d3-894a-72cf-de1afaacae45@ivitera.com>
 <72e9b581-4a91-2319-cb9f-0bcb370f34a1@ivitera.com> <871q6tbxvf.wl-tiwai@suse.de>
 <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
In-Reply-To: <22301bb6-d893-2e65-6ebd-1787ca231387@ivitera.com>
From: Chris Wulff <crwulff@gmail.com>
Date: Sun, 28 Apr 2024 11:30:47 -0400
Message-ID: <CAB0kiBJm=Ya6a1mWRZ28p9=D_BesH55DFk4fd4wP0be4zKPR7w@mail.gmail.com>
Subject: Re: usb:gadget:f_uac2: RFC: allowing multiple altsetttings for
 channel/samplesize combinations
To: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: Takashi Iwai <tiwai@suse.de>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, 
	Felipe Balbi <balbi@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, Julian Scheel <julian@jusst.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Keeping <john@metanate.com>, 
	AKASH KUMAR <quic_akakum@quicinc.com>, Jack Pham <jackp@codeaurora.org>, 
	Chris Wulff <Chris.Wulff@biamp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pavel,

  Following up on this and discussions in this patch series

https://lore.kernel.org/linux-usb/CO1PR17MB54195BE778868AFDFE2DCB36E1112@CO=
1PR17MB5419.namprd17.prod.outlook.com/

Example from that thread with c_alt_name changed to c_name as it lives
in an "alt.x" directory
and removal of the num_alt_modes in favor of just allowing "mkdir
alt.x" to create new alt mode
settings:

(all existing properties + the following new properties)
c_it_name
c_it_ch_name
c_fu_name
c_ot_name
p_it_name
p_it_ch_name
p_fu_name
p_ot_name

alt.0
  c_name
  p_name
alt.1 (for alt.1, alt.2, etc.)
  c_name
  p_name
  c_ssize
  p_ssize
  (Additional properties here for other things that are settable for
each alt mode,
   but the only one I've implemented in my prototype so far is sample size.=
)


Here is a more detailed breakdown of the (current) proposal:

* Allow the user to create "alt.x" directories inside uac1 and uac2
function configfs
  * Prior to creation of any of these alt.x subdirectories, the
function behaves the same
    as it does today. No "alt.x" directories would exist on creation
of the function.
  * Creation of "alt.0" contains only "c_name" and "p_name" to set the
USB string name
     for this alt mode, with the defaults as "Capture Inactive" and
"Playback Inactive"
  * Creation of "alt.x" where x is an integer, contains the same name
strings but
     with defaults of "Capture Active" and "Playback Active" and
additional files
     for any per-alt-mode configurable settings (such as c_ssize, p_ssize, =
etc.)
     At the time of creation, values for those are copied from the
corresponding settings
     in the function main configfs directory.
  * Creation of "alt.1" in particular changes the meaning of the files
in the main
     function configfs dir so that they are only _default_ values used
when creating
     "alt.x" directories and settings from "alt.1" will now be used
for alt mode 1.
     (Alt mode 1 always exists, even when "alt.1" has not been created.)

* ALSA card interface behavior
  * Configuration of the ALSA card interface remains the same. It is config=
ured
    when binding the function to match the settings in the main
function configfs.
    "alt.x" settings have no effect on the created ALSA card setup
  * Sample size will be converted between ALSA and USB data by
dropping extra bits
    or zero padding samples (eg 16->24 will zero pad a byte, 24->16
will drop a byte)
  * Channel count differences will ignore extra incoming channels and
zero outgoing
    extra channels (eg 8->2 will just copy the first two and ignore
the rest. 2->8 will
    copy the first two and zero the rest.)
  * Per-alt-mode configurable settings will have a read-only ALSA control (=
like
    sample rate does currently) that can be used to inform the program atta=
ched
    to the ALSA card what the current state of those settings are when the =
USB
    host selects an alt mode.

An simple example of how this could be used to create a second alt mode:

mkdir uac1.0
echo 24 > uac1.0/p_ssize
echo 24 > uac1.0/c_ssize
mkdir uac1.0/alt.2
echo 16 > uac1.0/alt.2/c_ssize

NOTE: Alt modes are separately selectable by the host for playback and capt=
ure
so the host can pick and choose as desired. There is no need to make an alt=
 mode
for every combination of playback and capture settings. In this
example the host can
pick either 24 or 16 bit samples for capture, but is only allowed 24
bit samples for
playback as both alt.1 (via uac1.0/p_ssize) and alt.2 (via default copied t=
o
uac1.0/alt.2/p_ssize) have been configured as 24-bit.


On Thu, Apr 25, 2024 at 11:08=E2=80=AFAM Pavel Hofman <pavel.hofman@ivitera=
.com> wrote:
>
>
> On 25. 04. 24 11:22, Takashi Iwai wrote:
> > On Wed, 24 Apr 2024 09:40:52 +0200,
> > Pavel Hofman wrote:
> >>
> >>
> >> On 17. 04. 24 13:07, Pavel Hofman wrote:
> >>
> >>> I am considering implementation of multiple altsettings to f_uac2, so
> >>> that multiple combinations of channels and samplesizes can be offered=
 to
> >>> the host.
> >>>
> >>> Configuration:
> >>> --------------
> >>> * each altsetting for each direction should define
> >>>    * channel mask
> >>>    * samplesize
> >>>    * hs_bint bInterval
> >>>    * c_sync type (for capture only)
> >>>
> >>>
> >>> Perhaps the easiest config would be allowing lists for the existing
> >>> parameters (like the multiple samplerates were implemented). All the
> >>> list params would have to have the same number of items - initial che=
ck.
> >>> First values in the list would apply to altsetting 1, second to
> >>> altsetting 2 etc.
> >>>
> >>> Or the altsetting could be some structured configfs param - please is
> >>> there any recommended standard for structured configfs params?
> >>>
> >>>
> >>> Should the config also adjust the list of allowed samplerates for eac=
h
> >>> altsetting? Technically it makes sense as higher number of channels c=
an
> >>> decrease the max samplerate, e.g. for via a TDM interface. If so, it
> >>> would need either the structured configuration or some "list of lists=
"
> >>> format.
> >>>
> >>>
> >>> Implementation:
> >>> ---------------
> >>>
> >>> Parameters could be turned to arrays of fixed predefined sizes, like =
the
> >>> p/s_srates. E.g. 5 max. altsettings in each direction would consume o=
nly
> >>> 4 * (5-1) + 3* (5-1) =3D 28 extra ints (excluding the samplerates con=
fig).
> >>>
> >>> Currently all descriptor structs are statically pre-allocated as ther=
e
> >>> are only two hard-coded altsettings. IMO the descriptors specific for
> >>> each altsetting could be allocated dynamically in a loop over all
> >>> none-zero alsettings.
> >>>
> >>> Please may I ask UAC2 gadget "stakeholders" for comments, suggestions=
,
> >>> recommendations, so that my eventual initial version was in some
> >>> generally acceptable direction?
> >>>
> >>
> >> This feature has coincidentally arisen in recent commits by Chris
> >> https://lore.kernel.org/lkml/c9928edb-8b2d-1948-40b8-c16e34cea3e2@ivit=
era.com/T/
> >>
> >> Maybe Takashi's commits to the midi gadget could be a way
> >> https://patchwork.kernel.org/project/alsa-devel/list/?series=3D769151&=
state=3D%2A&archive=3Dboth
> >> The midi gadget allows multiple configurations now, where configs are
> >> placed into a separate block.X configfs directory. That way the config=
fs
> >> recommendation to keep one value per item is adhered to and the
> >> configuration is nice and clean.
> >>
> >> This method would nicely allow various samplerate lists for each
> >> altsetting, without having to use some obscure list of lists.
> >>
> >> The f_uac2 tree config could have e.g. alt.1-X subdirs, to fit the
> >> altsetting ID. I am not sure the dot index not starting with 0 would b=
e
> >> an issue.
> >>
> >> Now the question would be what to do with the existing (and the new
> >> params added by Chris) flat-structure parameters which apply to (the
> >> only one) altsetting 1. Maybe they could be used as defaults for the
> >> other altsettings for unspecified parameters?
> >>
> >> I very much appreciate any input, thank you all in advance.
> >
> > IMO, a softer approach would be to use subdirs for alt1+ while flat
> > files are kept used for alt0.
>
> Thanks a lot for your help. IIUC almost all existing configs for the
> UAC1/2 functions apply to the "run" altsetting - altsetting 1. The
> altsetting 0 is for stopping the operation, IIUC. Actually that's how
> the stream stop is detected on the gadget side - transition alt1 -> alt0.
>
> Did you perhaps mean the first "running" altsetting?
>
>
> >  Alternatively, we may allow creating
> > alt0, too, and the values there will win over the flat values.
> >
>
> IIUC this would be the meaning of default configs, in case they are not
> specified in the subdir. I like that as it would make the configuration
> easier if not generated by some script.
>
> Thanks,
>
> Pavel.
>
>

