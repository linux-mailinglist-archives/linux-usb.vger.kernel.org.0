Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE573EEE9C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 16:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238032AbhHQOgg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 10:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237840AbhHQOgf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Aug 2021 10:36:35 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F7FC061764
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 07:36:02 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id o123so17918206qkf.12
        for <linux-usb@vger.kernel.org>; Tue, 17 Aug 2021 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rHC4xu8XiV7hD6jE5NQdbjctl0xEJeg3rUvgF2jRB2Y=;
        b=DWo+XjQosmPrQkjPqF+R48ffVp0kXQTSS1dM+VyIiZsZv/3vnZwLGRXruz8AVwM7gi
         cbgRwWYf/fddkoVAIslYL/xDUOSV/XfmIar6acEd5uFGOpPepevsUDx88Ke8uDvXHw/H
         /5EDsZSy+9pZhUK4wmjeBETXcUFW+VL5JFpYvPpD8m+RK2YkCo3yYzQmtdBoso3a95av
         0BG3IHFmf1vQBOY9SfUcethbS4CdjGqUPLU0T85Cc4Fm0KYAKotYmXrrLEkAnJU2YBET
         uSPGan7xsC9Z8NJJfHLdc5kq8gw7/OG3XuOOr3kh/y6TA0zFdUZEwn0F4Dg7LCeqDqYj
         6qNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rHC4xu8XiV7hD6jE5NQdbjctl0xEJeg3rUvgF2jRB2Y=;
        b=lAIGs3yK+LdMesObsgNBgSmCmFK9qIC7jcxhpSblzzxk73VLo61r0musxPgN/Y0i1w
         od2lFUNBjZRCyOlWsTShvagpyHd2vPajzU4ttpwH8DrFTbl/GOcNtcDW/MU2iq9W8C+Q
         URit1IuccdDqiyR3d+RV+Gy2Hx1qnDPBHmkAgugGeQCCZ/LvmGf53CLNye9CyJAWQMjH
         WUm4UGrM+6eQdNeVMjsbLqSavZVGnlFocd7iHoP9zmLj3ozCZbiMO6Pdwyc8EqbmWo79
         5cthXU8ObBLDHf7+olPjPzl2g/F+xLnA3E6pQf5MTrqZxxEd/1DEIkHqQyPAaY6GjN0l
         16Tw==
X-Gm-Message-State: AOAM530Ekuo4r7d7OtMPtYljqmyNjmxRX1SKRERCMEh1JN1mQ7J6XVGR
        By5FMx3fLTs0C5e62/kA9PSBi71p5xx5uoMgeHUSxw==
X-Google-Smtp-Source: ABdhPJy7cOnomMF+zuYD34BkSsjAbpxHxmAPWn8Ck31jhsQjDJFzEYUc94umzSpt5A22ee9aI267RZY4NKFJj4IZMNc=
X-Received: by 2002:ae9:f44c:: with SMTP id z12mr4264822qkl.433.1629210961617;
 Tue, 17 Aug 2021 07:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210816154632.381968-1-hdegoede@redhat.com> <YRuKdmzggen2Vu0K@kuha.fi.intel.com>
In-Reply-To: <YRuKdmzggen2Vu0K@kuha.fi.intel.com>
From:   Kyle Tso <kyletso@google.com>
Date:   Tue, 17 Aug 2021 22:35:45 +0800
Message-ID: <CAGZ6i=30AY8z5rdAjfwQ6z5_pp5BQE2xtdFh7XW9xd6VT_MyYw@mail.gmail.com>
Subject: Re: [PATCH regression fix] usb: typec: tcpm: Fix VDMs sometimes not
 being forwarded to alt-mode drivers
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 17, 2021 at 6:07 PM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Mon, Aug 16, 2021 at 05:46:32PM +0200, Hans de Goede wrote:
> > Commit a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no
> > snk_vdo"), stops tcpm_pd_data_request() calling tcpm_handle_vdm_request()
> > when port->nr_snk_vdo is not set. But the VDM might be intended for an
> > altmode-driver, in which case nr_snk_vdo does not matter.
> >
> > This change breaks the forwarding of connector hotplug (HPD) events
> > for displayport altmode on devices which don't set nr_snk_vdo.
> >
> > tcpm_pd_data_request() is the only caller of tcpm_handle_vdm_request(),
> > so we can move the nr_snk_vdo check to inside it, at which point we
> > have already looked up the altmode device so we can check for this too.
> >
> > Doing this check here also ensures that vdm_state gets set to
> > VDM_STATE_DONE if it was VDM_STATE_BUSY, even if we end up with
> > responding with PD_MSG_CTRL_NOT_SUPP later.
> >
> > Note that tcpm_handle_vdm_request() was already sending
> > PD_MSG_CTRL_NOT_SUPP in some circumstances, after moving the nr_snk_vdo
> > check the same error-path is now taken when that check fails. So that
> > we have only one error-path for this and not two. Replace the
> > tcpm_queue_message(PD_MSG_CTRL_NOT_SUPP) used by the existing error-path
> > with the more robust tcpm_pd_handle_msg() from the (now removed) second
> > error-path.

Thanks for fixing this problem!

> >
> > Cc: Kyle Tso <kyletso@google.com>
> > Fixes: a20dcf53ea98 ("usb: typec: tcpm: Respond Not_Supported if no snk_vdo")
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>

Acked-by: Kyle Tso <kyletso@google.com>

> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index b9bb63d749ec..f4079b5cb26d 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -1737,6 +1737,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
> >       return rlen;
> >  }
> >
> > +static void tcpm_pd_handle_msg(struct tcpm_port *port,
> > +                            enum pd_msg_request message,
> > +                            enum tcpm_ams ams);
> > +
> >  static void tcpm_handle_vdm_request(struct tcpm_port *port,
> >                                   const __le32 *payload, int cnt)
> >  {
> > @@ -1764,11 +1768,11 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
> >               port->vdm_state = VDM_STATE_DONE;
> >       }
> >
> > -     if (PD_VDO_SVDM(p[0])) {
> > +     if (PD_VDO_SVDM(p[0]) && (adev || tcpm_vdm_ams(port) || port->nr_snk_vdo)) {
> >               rlen = tcpm_pd_svdm(port, adev, p, cnt, response, &adev_action);
> >       } else {
> >               if (port->negotiated_rev >= PD_REV30)
> > -                     tcpm_queue_message(port, PD_MSG_CTRL_NOT_SUPP);
> > +                     tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> >       }
> >
> >       /*
> > @@ -2471,10 +2475,7 @@ static void tcpm_pd_data_request(struct tcpm_port *port,
> >                                          NONE_AMS);
> >               break;
> >       case PD_DATA_VENDOR_DEF:
> > -             if (tcpm_vdm_ams(port) || port->nr_snk_vdo)
> > -                     tcpm_handle_vdm_request(port, msg->payload, cnt);
> > -             else if (port->negotiated_rev > PD_REV20)
> > -                     tcpm_pd_handle_msg(port, PD_MSG_CTRL_NOT_SUPP, NONE_AMS);
> > +             tcpm_handle_vdm_request(port, msg->payload, cnt);
> >               break;
> >       case PD_DATA_BIST:
> >               port->bist_request = le32_to_cpu(msg->payload[0]);
> > --
> > 2.31.1
>
> --
> heikki
