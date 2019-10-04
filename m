Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1CFCCBFB0
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 17:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389971AbfJDPr4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 11:47:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57471 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389952AbfJDPr4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Oct 2019 11:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570204075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ktl6MyeiuREO/Oh528hMjDxCOoPZQXRtxNlAvB+594Y=;
        b=LE3q4bweinvnwWwdGts1oqYTtS8W08Jk9/loL0Dw6407/+Qeh42W3gKr4ItNroLXFcg1P2
        zcYNh8VhvJHFeZpyAvLDecx+wOzBExgJwYYePSZv0+mfSt+wrRTvD3CRQCMYt/GayUhgBi
        XG/5KQXCo3g3ZOnM7q1IusWbUCk/aJ8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-7wV5ZzvcNaq6a8tb_WZ34g-1; Fri, 04 Oct 2019 11:47:53 -0400
Received: by mail-qt1-f199.google.com with SMTP id k53so6888481qtk.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Oct 2019 08:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9OsNcLjtdXPJ/SW8QGUlR3bQh+YXqCRuxtYDPBXH6/8=;
        b=WNmTn6HXPht/vFPJwLCrO6zroAqQMAGZC8hF0rFegycRo4Z6lRkUuuwaehU27YKJfq
         vPO30YzmG33jlxY6S1IYZBF/IFbr4g3wu4Ho0UB6DDN98O9J3A4umE+nW+1Corm548g9
         ajxL4ECDMSf95SLz2Sz8WcVoK8V9iTwcRtQ7iJY8XbGL0ONkpj6itVQ2cyBt+fzZT+2O
         l31Zhy4DgvuAR7zcsk0xijdfcn5K3YgwoYQDo5plsUpDbsgRbZ5aftpXqWx8OSXShhEi
         aGh1TXQRn5d6puZlOpcDt1Vu8VrHdIkWPfUcH4GbFfo3Iu5hkvyM0oPp+hnN9uazKhKn
         Rvug==
X-Gm-Message-State: APjAAAVNgq8NTMdv+gVjrlQsuUlueYxbw64aZr14wRnxI0kmlyNsdycE
        EHRl9Nz5mem+LoQisEU1L/HEEv0l3xvlQ5TpmuaVOzFKfTLiQ0AHAPaw5ieiDHK2JWdKm6rsW/R
        Z9tB8sXpBP84D+ObG2m1zsgQU4edbveae8XBX
X-Received: by 2002:ac8:4251:: with SMTP id r17mr16423713qtm.260.1570204072381;
        Fri, 04 Oct 2019 08:47:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6FxubLpx1DY5tw7A80gNEZLZIFzJvX8Vn5s+0UGxgKyvMK5QYQHLxXjveiG+814OzYNkzLFHpgrcS0awzti4=
X-Received: by 2002:ac8:4251:: with SMTP id r17mr16423655qtm.260.1570204071887;
 Fri, 04 Oct 2019 08:47:51 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000cd1def0592ab9697@google.com> <Pine.LNX.4.44L0.1910031449210.1797-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1910031449210.1797-100000@iolanthe.rowland.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Oct 2019 11:47:40 -0400
Message-ID: <CAO-hwJ+51ixP1u-3DGRo-StHmKcEfy6MFFoooSg0qs_h7pCViQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Fix assumption that devices have inputs
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
X-MC-Unique: 7wV5ZzvcNaq6a8tb_WZ34g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 3, 2019 at 2:54 PM Alan Stern <stern@rowland.harvard.edu> wrote=
:
>
> The syzbot fuzzer found a slab-out-of-bounds write bug in the hid-gaff
> driver.  The problem is caused by the driver's assumption that the
> device must have an input report.  While this will be true for all
> normal HID input devices, a suitably malicious device can violate the
> assumption.
>
> The same assumption is present in over a dozen other HID drivers.
> This patch fixes them by checking that the list of hid_inputs for the
> hid_device is nonempty before allowing it to be used.
>
> Reported-and-tested-by: syzbot+403741a091bf41d4ae79@syzkaller.appspotmail=
.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>

Thanks Alan pushed to for-5.4/upstream-fixes

Cheers,
Benjamin

>
> ---
>
> [as1921]
>
>
>  drivers/hid/hid-axff.c           |   11 +++++++++--
>  drivers/hid/hid-dr.c             |   12 +++++++++---
>  drivers/hid/hid-emsff.c          |   12 +++++++++---
>  drivers/hid/hid-gaff.c           |   12 +++++++++---
>  drivers/hid/hid-holtekff.c       |   12 +++++++++---
>  drivers/hid/hid-lg2ff.c          |   12 +++++++++---
>  drivers/hid/hid-lg3ff.c          |   11 +++++++++--
>  drivers/hid/hid-lg4ff.c          |   11 +++++++++--
>  drivers/hid/hid-lgff.c           |   11 +++++++++--
>  drivers/hid/hid-logitech-hidpp.c |   11 +++++++++--
>  drivers/hid/hid-microsoft.c      |   12 +++++++++---
>  drivers/hid/hid-sony.c           |   12 +++++++++---
>  drivers/hid/hid-tmff.c           |   12 +++++++++---
>  drivers/hid/hid-zpff.c           |   12 +++++++++---
>  14 files changed, 126 insertions(+), 37 deletions(-)
>
> Index: usb-devel/drivers/hid/hid-gaff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-gaff.c
> +++ usb-devel/drivers/hid/hid-gaff.c
> @@ -64,14 +64,20 @@ static int gaff_init(struct hid_device *
>  {
>         struct gaff_device *gaff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next,
> -                                               struct hid_input, list);
> +       struct hid_input *hidinput;
>         struct list_head *report_list =3D
>                         &hid->report_enum[HID_OUTPUT_REPORT].report_list;
>         struct list_head *report_ptr =3D report_list;
> -       struct input_dev *dev =3D hidinput->input;
> +       struct input_dev *dev;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         if (list_empty(report_list)) {
>                 hid_err(hid, "no output reports found\n");
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-axff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-axff.c
> +++ usb-devel/drivers/hid/hid-axff.c
> @@ -63,13 +63,20 @@ static int axff_init(struct hid_device *
>  {
>         struct axff_device *axff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_first_entry(&hid->inputs, str=
uct hid_input, list);
> +       struct hid_input *hidinput;
>         struct list_head *report_list =3D&hid->report_enum[HID_OUTPUT_REP=
ORT].report_list;
> -       struct input_dev *dev =3D hidinput->input;
> +       struct input_dev *dev;
>         int field_count =3D 0;
>         int i, j;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_first_entry(&hid->inputs, struct hid_input, lis=
t);
> +       dev =3D hidinput->input;
> +
>         if (list_empty(report_list)) {
>                 hid_err(hid, "no output reports found\n");
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-dr.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-dr.c
> +++ usb-devel/drivers/hid/hid-dr.c
> @@ -75,13 +75,19 @@ static int drff_init(struct hid_device *
>  {
>         struct drff_device *drff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_first_entry(&hid->inputs,
> -                                               struct hid_input, list);
> +       struct hid_input *hidinput;
>         struct list_head *report_list =3D
>                         &hid->report_enum[HID_OUTPUT_REPORT].report_list;
> -       struct input_dev *dev =3D hidinput->input;
> +       struct input_dev *dev;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_first_entry(&hid->inputs, struct hid_input, lis=
t);
> +       dev =3D hidinput->input;
> +
>         if (list_empty(report_list)) {
>                 hid_err(hid, "no output reports found\n");
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-emsff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-emsff.c
> +++ usb-devel/drivers/hid/hid-emsff.c
> @@ -47,13 +47,19 @@ static int emsff_init(struct hid_device
>  {
>         struct emsff_device *emsff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_first_entry(&hid->inputs,
> -                                               struct hid_input, list);
> +       struct hid_input *hidinput;
>         struct list_head *report_list =3D
>                         &hid->report_enum[HID_OUTPUT_REPORT].report_list;
> -       struct input_dev *dev =3D hidinput->input;
> +       struct input_dev *dev;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_first_entry(&hid->inputs, struct hid_input, lis=
t);
> +       dev =3D hidinput->input;
> +
>         if (list_empty(report_list)) {
>                 hid_err(hid, "no output reports found\n");
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-holtekff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-holtekff.c
> +++ usb-devel/drivers/hid/hid-holtekff.c
> @@ -124,13 +124,19 @@ static int holtekff_init(struct hid_devi
>  {
>         struct holtekff_device *holtekff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next,
> -                                               struct hid_input, list);
> +       struct hid_input *hidinput;
>         struct list_head *report_list =3D
>                         &hid->report_enum[HID_OUTPUT_REPORT].report_list;
> -       struct input_dev *dev =3D hidinput->input;
> +       struct input_dev *dev;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         if (list_empty(report_list)) {
>                 hid_err(hid, "no output report found\n");
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-lg2ff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-lg2ff.c
> +++ usb-devel/drivers/hid/hid-lg2ff.c
> @@ -50,11 +50,17 @@ int lg2ff_init(struct hid_device *hid)
>  {
>         struct lg2ff_device *lg2ff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next,
> -                                               struct hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *dev;
>         int error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         /* Check that the report looks ok */
>         report =3D hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 7);
>         if (!report)
> Index: usb-devel/drivers/hid/hid-lg3ff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-lg3ff.c
> +++ usb-devel/drivers/hid/hid-lg3ff.c
> @@ -117,12 +117,19 @@ static const signed short ff3_joystick_a
>
>  int lg3ff_init(struct hid_device *hid)
>  {
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next, struc=
t hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *dev;
>         const signed short *ff_bits =3D ff3_joystick_ac;
>         int error;
>         int i;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         /* Check that the report looks ok */
>         if (!hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 35))
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-lg4ff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-lg4ff.c
> +++ usb-devel/drivers/hid/hid-lg4ff.c
> @@ -1253,8 +1253,8 @@ static int lg4ff_handle_multimode_wheel(
>
>  int lg4ff_init(struct hid_device *hid)
>  {
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next, struc=
t hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *dev;
>         struct list_head *report_list =3D &hid->report_enum[HID_OUTPUT_RE=
PORT].report_list;
>         struct hid_report *report =3D list_entry(report_list->next, struc=
t hid_report, list);
>         const struct usb_device_descriptor *udesc =3D &(hid_to_usb_dev(hi=
d)->descriptor);
> @@ -1266,6 +1266,13 @@ int lg4ff_init(struct hid_device *hid)
>         int mmode_ret, mmode_idx =3D -1;
>         u16 real_product_id;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         /* Check that the report looks ok */
>         if (!hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 7))
>                 return -1;
> Index: usb-devel/drivers/hid/hid-lgff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-lgff.c
> +++ usb-devel/drivers/hid/hid-lgff.c
> @@ -115,12 +115,19 @@ static void hid_lgff_set_autocenter(stru
>
>  int lgff_init(struct hid_device* hid)
>  {
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next, struc=
t hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *dev;
>         const signed short *ff_bits =3D ff_joystick;
>         int error;
>         int i;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         /* Check that the report looks ok */
>         if (!hid_validate_values(hid, HID_OUTPUT_REPORT, 0, 0, 7))
>                 return -ENODEV;
> Index: usb-devel/drivers/hid/hid-logitech-hidpp.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-logitech-hidpp.c
> +++ usb-devel/drivers/hid/hid-logitech-hidpp.c
> @@ -2084,8 +2084,8 @@ static void hidpp_ff_destroy(struct ff_d
>  static int hidpp_ff_init(struct hidpp_device *hidpp, u8 feature_index)
>  {
>         struct hid_device *hid =3D hidpp->hid_dev;
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next, struc=
t hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *dev;
>         const struct usb_device_descriptor *udesc =3D &(hid_to_usb_dev(hi=
d)->descriptor);
>         const u16 bcdDevice =3D le16_to_cpu(udesc->bcdDevice);
>         struct ff_device *ff;
> @@ -2094,6 +2094,13 @@ static int hidpp_ff_init(struct hidpp_de
>         int error, j, num_slots;
>         u8 version;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         if (!dev) {
>                 hid_err(hid, "Struct input_dev not set!\n");
>                 return -EINVAL;
> Index: usb-devel/drivers/hid/hid-microsoft.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-microsoft.c
> +++ usb-devel/drivers/hid/hid-microsoft.c
> @@ -328,11 +328,17 @@ static int ms_play_effect(struct input_d
>
>  static int ms_init_ff(struct hid_device *hdev)
>  {
> -       struct hid_input *hidinput =3D list_entry(hdev->inputs.next,
> -                                               struct hid_input, list);
> -       struct input_dev *input_dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *input_dev;
>         struct ms_data *ms =3D hid_get_drvdata(hdev);
>
> +       if (list_empty(&hdev->inputs)) {
> +               hid_err(hdev, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hdev->inputs.next, struct hid_input, list=
);
> +       input_dev =3D hidinput->input;
> +
>         if (!(ms->quirks & MS_QUIRK_FF))
>                 return 0;
>
> Index: usb-devel/drivers/hid/hid-sony.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-sony.c
> +++ usb-devel/drivers/hid/hid-sony.c
> @@ -2250,9 +2250,15 @@ static int sony_play_effect(struct input
>
>  static int sony_init_ff(struct sony_sc *sc)
>  {
> -       struct hid_input *hidinput =3D list_entry(sc->hdev->inputs.next,
> -                                               struct hid_input, list);
> -       struct input_dev *input_dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *input_dev;
> +
> +       if (list_empty(&sc->hdev->inputs)) {
> +               hid_err(sc->hdev, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(sc->hdev->inputs.next, struct hid_input, =
list);
> +       input_dev =3D hidinput->input;
>
>         input_set_capability(input_dev, EV_FF, FF_RUMBLE);
>         return input_ff_create_memless(input_dev, NULL, sony_play_effect)=
;
> Index: usb-devel/drivers/hid/hid-tmff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-tmff.c
> +++ usb-devel/drivers/hid/hid-tmff.c
> @@ -114,12 +114,18 @@ static int tmff_init(struct hid_device *
>         struct tmff_device *tmff;
>         struct hid_report *report;
>         struct list_head *report_list;
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next,
> -                                                       struct hid_input,=
 list);
> -       struct input_dev *input_dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *input_dev;
>         int error;
>         int i;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       input_dev =3D hidinput->input;
> +
>         tmff =3D kzalloc(sizeof(struct tmff_device), GFP_KERNEL);
>         if (!tmff)
>                 return -ENOMEM;
> Index: usb-devel/drivers/hid/hid-zpff.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/hid-zpff.c
> +++ usb-devel/drivers/hid/hid-zpff.c
> @@ -54,11 +54,17 @@ static int zpff_init(struct hid_device *
>  {
>         struct zpff_device *zpff;
>         struct hid_report *report;
> -       struct hid_input *hidinput =3D list_entry(hid->inputs.next,
> -                                               struct hid_input, list);
> -       struct input_dev *dev =3D hidinput->input;
> +       struct hid_input *hidinput;
> +       struct input_dev *dev;
>         int i, error;
>
> +       if (list_empty(&hid->inputs)) {
> +               hid_err(hid, "no inputs found\n");
> +               return -ENODEV;
> +       }
> +       hidinput =3D list_entry(hid->inputs.next, struct hid_input, list)=
;
> +       dev =3D hidinput->input;
> +
>         for (i =3D 0; i < 4; i++) {
>                 report =3D hid_validate_values(hid, HID_OUTPUT_REPORT, 0,=
 i, 1);
>                 if (!report)
>

