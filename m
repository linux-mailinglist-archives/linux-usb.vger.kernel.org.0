Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC640232A7C
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jul 2020 05:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728528AbgG3DiW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 23:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728470AbgG3DiW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jul 2020 23:38:22 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E78C061794
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 20:38:21 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id g22so5864135vke.9
        for <linux-usb@vger.kernel.org>; Wed, 29 Jul 2020 20:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z1sAyLTDEjPM6zyaHgMGx2Wjb/mXRdUmNjDBN1uT0q4=;
        b=gJwzjMhsyl7z5qQHIT4ATU64NfDhGWH8Yy6QsBH4feSwQGonlDnIyhBffRnVCxPjYm
         XOyvlqZL0vWEMZL7Ub0+z5NsBy/qkBQfF6mXo7fRQTmLiG3fXgNUcgIy4GqYCcwfkrXi
         V2uQyR3LekHvhKFdXbSjcwn8wNPHdJCTvTxVAlcfczACk2/QaiqqBwjzeuKOeXwNpilW
         +QuiN8Fa5WS7KjQdgOAEyDsY2XoYtdnZwM5mZixDuU+TJO8BJh3aqpD+lbbPP/JoQR49
         rqgW3ekcHn6gEZozVfm9i1Fhrt3tpxDCVhilO5oNDRcMSx4snhTkM38Ch6EBwYtL3aOa
         4ZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z1sAyLTDEjPM6zyaHgMGx2Wjb/mXRdUmNjDBN1uT0q4=;
        b=dCxhK6GL6fvI7ZYE8ERQZTLvrDcT7YMn8Tu/ZQY4OB3Hc7AO7JD3WXa368+sr6RxP3
         lMP3oJw7jXKWgi8fe8fdcmMjKYJ9gzZHfJAZYY1PnQIt3YxVLhm9ELHJOTw9FzpO16U3
         IGsu1wRDPVVPLRULKip5sJ66axs38MfBBeiAROeMQJ0R83iKG8P3VGHCEWx9Hjv3ZMD2
         3SKkRZLkTrnUSdPADHn9/qI2mIFbeXzkhDz63jNRMIi1icUFv0JrGfTb15HNAU+YzcxZ
         aYDGSmQ9uETE4TMbBjmsf9S85nW6D/o3q8yKhcWo6gvhabU2FtJzFsEomFxCVXlJ7KOI
         LTxA==
X-Gm-Message-State: AOAM530lfZCB7vvS++aGGNoCDYlYshv/vY7dpcul/TcOODZj2iRuQllN
        edS8xHS1EBnpwhOQPfheWBFPyLfwccis1sT27IdS/Q==
X-Google-Smtp-Source: ABdhPJyRpse/6SEsyCNIObavCe1OrUc08rciOedYIEiDwarn5tQpeVbFpe3wKPhtvJUw/q52Dxb8lzVrHqXgF9y7cDA=
X-Received: by 2002:a1f:2688:: with SMTP id m130mr556541vkm.48.1596080300428;
 Wed, 29 Jul 2020 20:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200724020551.2737376-1-badhri@google.com> <20200729145309.GA3490882@kroah.com>
 <CAPTae5+JbpzC7qzznXFqLPL-KrPzHLaHsJXj29Bx-jW1zEPEAQ@mail.gmail.com> <f7fe51da-5dd7-5065-b5c7-426bf8e07c29@roeck-us.net>
In-Reply-To: <f7fe51da-5dd7-5065-b5c7-426bf8e07c29@roeck-us.net>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Wed, 29 Jul 2020 20:37:44 -0700
Message-ID: <CAPTae5JMaxa5ZVZG=DKshYVoeedon1KvH2coygCa4dRS8qKAxg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tcpm: Migrate workqueue to RT priority for
 processing events
To:     Guenter Roeck <linux@roeck-us.net>, hdegoede@redhat.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Guenter,

I see that Hans is saying that he has submitted some patch here.
https://lore.kernel.org/lkml/65f27abc-69c8-3877-be5b-e5e478153af9@redhat.co=
m/
But, haven't found the actual patches yet !

Thanks,
Badhri

On Wed, Jul 29, 2020 at 8:03 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/29/20 7:28 PM, Badhri Jagan Sridharan wrote:
> > Hi Greg,
> >
> > Sure just sent the new patch v3.
> >
> > Patch applies cleanly on my end. So wondering what I am missing.
>
> I expected your patch to conflict with Hans' patch series.
> Maybe those are in a different tree/branch ?
>
> Guenter
>
> > Just in case if you are still noticing merge conflicts.
> >
> > Here is the git log of my local tree:
> > 633198cd2945b7 (HEAD -> usb-next-1) usb: typec: tcpm: Migrate workqueue=
 to RT priority for processing events
> > fa56dd9152ef95 (origin/usb-next) Merge tag 'usb-serial-5.9-rc1' of http=
s://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
> > 25252919a1050e xhci: dbgtty: Make some functions static
> > b0e02550346e67 xhci: dbc: Make function xhci_dbc_ring_alloc() static
> > ca6377900974c3 Revert "usb: dwc2: override PHY input signals with usb r=
ole switch support"
> > 09df709cb5aeb2 Revert "usb: dwc2: don't use ID/Vbus detection if usb-ro=
le-switch on STM32MP15 SoCs"
> > 17a82716587e9d USB: iowarrior: fix up report size handling for some dev=
ices
> > e98ba8cc3f8a89 Merge tag 'usb-for-v5.9' of git://git.kernel.org/pub/scm=
/linux/kernel/git/balbi/usb <http://git.kernel.org/pub/scm/linux/kernel/git=
/balbi/usb> into usb-next
> > c97793089b11f7 Merge 5.8-rc7 into usb-next
> > 92ed301919932f (tag: v5.8-rc7, origin/usb-linus, origin/main) Linux 5.8=
-rc7
> >
> > Was comparing against https://git.kernel.org/pub/scm/linux/kernel/git/g=
regkh/usb.git/log/?h=3Dusb-next
> >
> > Thanks,
> > Badhri
> >
> > On Wed, Jul 29, 2020 at 7:53 AM Greg Kroah-Hartman <gregkh@linuxfoundat=
ion.org <mailto:gregkh@linuxfoundation.org>> wrote:
> >
> >     On Thu, Jul 23, 2020 at 07:05:51PM -0700, Badhri Jagan Sridharan wr=
ote:
> >     > "tReceiverResponse 15 ms Section 6.6.2
> >     > The receiver of a Message requiring a response Shall respond
> >     > within tReceiverResponse in order to ensure that the
> >     > sender=E2=80=99s SenderResponseTimer does not expire."
> >     >
> >     > When the cpu complex is busy running other lower priority
> >     > work items, TCPM's work queue sometimes does not get scheduled
> >     > on time to meet the above requirement from the spec.
> >     > Moving to kthread_work apis to run with real time priority.
> >     > Just lower than the default threaded irq priority,
> >     > MAX_USER_RT_PRIO/2 + 1. (Higher number implies lower priority).
> >     >
> >     > Further, as observed in 1ff688209e2e, moving to hrtimers to
> >     > overcome scheduling latency while scheduling the delayed work.
> >     >
> >     > TCPM has three work streams:
> >     > 1. tcpm_state_machine
> >     > 2. vdm_state_machine
> >     > 3. event_work
> >     >
> >     > tcpm_state_machine and vdm_state_machine both schedule work in
> >     > future i.e. delayed. Hence each of them have a corresponding
> >     > hrtimer, tcpm_state_machine_timer & vdm_state_machine_timer.
> >     >
> >     > When work is queued right away kthread_queue_work is used.
> >     > Else, the relevant timer is programmed and made to queue
> >     > the kthread_work upon timer expiry.
> >     >
> >     > kthread_create_worker only creates one kthread worker thread,
> >     > hence single threadedness of workqueue is retained.
> >     >
> >     > Signed-off-by: Badhri Jagan Sridharan <badhri@google.com <mailto:=
badhri@google.com>>
> >
> >     This doesn't apply against my usb-next branch at all.
> >
> >     Can you rebase and resend?
> >
> >     Remember to collect the reviewed-by tags as well when you do so.
> >
> >     thanks,
> >
> >     greg k-h
> >
>
