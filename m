Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9567851BDDC
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 13:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238102AbiEELTH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 07:19:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356881AbiEELTF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 07:19:05 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3065E120A1
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651749323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OQyaI2uxtELWwJK8aK/IAeDd83VcGCzUBY0+J7IREcg=;
        b=D03YI3I6XB6dgIs8uVXtzwgcedmQZW6jVcYaG2KbLJJpGHpP+dp0uQMdjhIu4rBQYDPoyH
        9IgxvAuBHb7tO596kJhnCaYqmwaS8qTy72gXdGggYyO2r6GA0BxWcb0NLX7np4xR+8HxfR
        ve56oUG54aD1gMb9x2h8d/vF3m4hnbw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-nAYfx4RVPMWDXhc2yRGUnA-1; Thu, 05 May 2022 07:15:22 -0400
X-MC-Unique: nAYfx4RVPMWDXhc2yRGUnA-1
Received: by mail-qt1-f200.google.com with SMTP id i12-20020ac85e4c000000b002f3914cb0c7so3061149qtx.15
        for <linux-usb@vger.kernel.org>; Thu, 05 May 2022 04:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OQyaI2uxtELWwJK8aK/IAeDd83VcGCzUBY0+J7IREcg=;
        b=jX4lDcJq6fYH7olJWI9FInYZ8gn1j8FlNEPJ0iuIItxD38yIxHD+IPM8vW50j2oUVB
         +u5RUtcmdeiTB1Ok7K1sKTQNV4KTseNcQvS0qOBo0Xe5MjuHiEpj5FadmFz99QvDFMvG
         MtNE5pYF00ztaFufsJTuRubM9uKqt4Et1poF5fGoa2X6s/43ZjY8DB6Vo5jXsvg1AsHj
         aB6+AwErB3XrmCKK66bTItbKeNex6Fot3e6Y3nmyn+bGKtRU5M9bEZDxDIdlWLMbWFdy
         BBL0ZAEOnOshUBrv48ob3aJcGmI7swrsWDIE9t9rbJ6cJVnZzjkc2tOEa47WdeSKw7hb
         4apA==
X-Gm-Message-State: AOAM533PSBfj3xxwkuGpzgmPjpyfvPVdH4vkvigsylYFwvJKyPjEx7n8
        QN5qLD8omYXZ1oyzx4ih2N/Y5Gt7c5sOUufonFtrTv3VsFLPRQMnYAcq/AbNr6a3Jn+F7TKh+8k
        t2ChyHh+D28f0cwymoGNtAZf2eRXJU765zzvP
X-Received: by 2002:a05:6214:626:b0:45a:d14a:eb54 with SMTP id a6-20020a056214062600b0045ad14aeb54mr667828qvx.126.1651749322366;
        Thu, 05 May 2022 04:15:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP22nWSksh7xXOuje10XOD2NQkMJe/xZVVUExVpeRoRH5dd/MzOCEsQJsiA28Wp1mWxn7urYvIotTU8IX9MJQ=
X-Received: by 2002:a05:6214:626:b0:45a:d14a:eb54 with SMTP id
 a6-20020a056214062600b0045ad14aeb54mr667816qvx.126.1651749322179; Thu, 05 May
 2022 04:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220504083612.143463-1-jtornosm@redhat.com> <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
 <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
In-Reply-To: <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Thu, 5 May 2022 13:15:11 +0200
Message-ID: <CABk-BGt8dFKkRvFZHpJnkHyObZ2G3D102zvyEFjVYjaFVRiQdg@mail.gmail.com>
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Oliver,

Of course, I am working with usbip to remotize usb devices, that is
the reason why unbind/bind is needed and with the btusb devices that I
have, it was not working.

Best regards
Jos=C3=A9 Ignacio

On Thu, May 5, 2022 at 12:19 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
>
> On 04.05.22 14:23, Marcel Holtmann wrote:
> >
> >> @@ -394,6 +397,9 @@ static const struct usb_device_id usb_quirk_list[]=
 =3D {
> >>      /* ELMO L-12F document camera */
> >>      { USB_DEVICE(0x09a1, 0x0028), .driver_info =3D USB_QUIRK_DELAY_CT=
RL_MSG },
> >>
> >> +    /* CSR Bluetooth */
> >> +    { USB_DEVICE(0x0a12, 0x0001), .driver_info =3D USB_QUIRK_SKIP_UNC=
ONFIGURE },
> >> +
> > NAK. I said this before.
> >
> > The VID:PID 0a12:0001 is used in millions of products that work
> > correctly. Only because some counterfeit products get things wrong
> > doesn=E2=80=99t mean all get marked as broken.
> >
>
> Hi,
>
> if I may ask, how certain is that? Soft unbinding is probably not
> a common operation.
>
>     Regards
>         Oliver
>

