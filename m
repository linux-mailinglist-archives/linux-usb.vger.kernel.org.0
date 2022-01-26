Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1A849C27F
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jan 2022 05:08:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbiAZEIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 23:08:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237542AbiAZEIa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 23:08:30 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8EB8C06173B
        for <linux-usb@vger.kernel.org>; Tue, 25 Jan 2022 20:08:29 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a8so35641088ejc.8
        for <linux-usb@vger.kernel.org>; Tue, 25 Jan 2022 20:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rlsXW9yeDjYLQW3dEtaDwpBR5jtFfvtNfcrowvAf2iE=;
        b=WBaJKjMJMp3TieYUfUOpFKFuxvycRbffe3njakH1VrBhWkf2N49UEilPpDu2/CZNHu
         riDpCa0WKVdwBrCdcpaO4dnDlo7ZGhFsT6SaL+IaMCHYbY05E2X4dmm1P+kVDPo2Xfh+
         HaGlCBBP/1pptEh3cLDRpadRE1cUUM0j5OYjzc6j2TwG4qSKjRiCBJI82yMYMBjKORUF
         i3NSXM24NsvAV6epcjMIgttadS+e+qnQvyhI3tALxO0Y6oqUI5+Rktqbbod2DNbVPH5T
         HiVHaHpjdbUQpUtpGDrvA5shp+lm9GqCmzzMgzaKmbrYBAc+JD0A23gerV/+ufDtJ8we
         I2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rlsXW9yeDjYLQW3dEtaDwpBR5jtFfvtNfcrowvAf2iE=;
        b=ZAK79l2x4qqPICdOKhy0XmTRfrSM212yvfjJ7G4X2Yk07u02+4l5/4dsTyntfL316K
         LQAHQCGJaBB8K5rb1AStBiku2fsOekUuP8Mbbg+gncDKvQuNVOcjCK5DVkAUbbteP6e3
         3qA8ncpVunvAHBBPD7uoXcqAE5eTluIe7ItVtXa4OwDaL4FvI6SZMBAtcQADg7NkPgtD
         YkxutCc537zlYB5uew9aEQNLLXs/ridL90H246jyvKABo+iR7Q+yvWOV0hWa4QN9pH3y
         F/9begHFcO93vIxEhFqELiNAM7q3fbwdzzrCvpdW2XiUtcV5TgpuDtAN2Q6qKBOkPOlJ
         ZzeA==
X-Gm-Message-State: AOAM532LKdpFM1fr+lkB1UMjp5hmqPXrnZXeo2Uz8TkrnJmDTtR114DT
        Mm1AeXT6OJ7au8vGSsPXjH4NYKTugPYqcl/gxFjbQw==
X-Google-Smtp-Source: ABdhPJxNIoOY3/zX/P4OFwm4zlrGb0Rp9uvybWi0VL071itCijWolP/s3CUdVNupoia9WJBMEnR6qEH/OmwhEvjv+Mg=
X-Received: by 2002:a17:906:e18:: with SMTP id l24mr18586078eji.514.1643170108168;
 Tue, 25 Jan 2022 20:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20220126020016.3159598-1-badhri@google.com> <1c5777ae-d178-d1f7-b7a0-a60a7f58279e@roeck-us.net>
In-Reply-To: <1c5777ae-d178-d1f7-b7a0-a60a7f58279e@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 25 Jan 2022 20:07:51 -0800
Message-ID: <CAPTae5+hkLXmumQrJhV5PW5oRCGhUQwF1tvMQQ2SKjeUhoWtxw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb: typec: tcpm: Do not disconnect while
 receiving VBUS off
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

My bad ! Apologies .. fixing it in V3..


On Tue, Jan 25, 2022 at 7:34 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 1/25/22 18:00, Badhri Jagan Sridharan wrote:
> > With some chargers, vbus might momentarily raise above VSAFE5V and fall
> > back to 0V before tcpm gets to read port->tcpc->get_vbus. This will
> > report a VBUS off event causing TCPM to transition to SNK_UNATTACHED
> > where it should be waiting in either SNK_ATTACH_WAIT or SNK_DEBOUNCED
> > state. This patch makes TCPM avoid vbus off events while in
> > SNK_ATTACH_WAIT or SNK_DEBOUNCED state.
> >
> > Stub from the spec:
> >      "4.5.2.2.4.2 Exiting from AttachWait.SNK State
> >      A Sink shall transition to Unattached.SNK when the state of both
> >      the CC1 and CC2 pins is SNK.Open for at least tPDDebounce.
> >      A DRP shall transition to Unattached.SRC when the state of both
> >      the CC1 and CC2 pins is SNK.Open for at least tPDDebounce."
> >
> > [23.194131] CC1: 0 -> 0, CC2: 0 -> 5 [state SNK_UNATTACHED, polarity 0, connected]
> > [23.201777] state change SNK_UNATTACHED -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
> > [23.209949] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
> > [23.300579] VBUS off
> > [23.300668] state change SNK_ATTACH_WAIT -> SNK_UNATTACHED [rev3 NONE_AMS]
> > [23.301014] VBUS VSAFE0V
> > [23.301111] Start toggling
> >
> > Fixes: f0690a25a140b8 ("staging: typec: USB Type-C Port Manager (tcpm)")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
>
> Why did you drop the Reviewed-by/Acked-by tags ?
>
> Guenter
>
> > ---
> > Changes since v1:
> > - Fix typos stated by Guenter Roeck.
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 59d4fa2443f2..3bf79f52bd34 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -5156,7 +5156,8 @@ static void _tcpm_pd_vbus_off(struct tcpm_port *port)
> >       case SNK_TRYWAIT_DEBOUNCE:
> >               break;
> >       case SNK_ATTACH_WAIT:
> > -             tcpm_set_state(port, SNK_UNATTACHED, 0);
> > +     case SNK_DEBOUNCED:
> > +             /* Do nothing, as TCPM is still waiting for vbus to reach VSAFE5V to connect */
> >               break;
> >
> >       case SNK_NEGOTIATE_CAPABILITIES:
>
