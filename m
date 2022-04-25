Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5816D50E697
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 19:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239132AbiDYRNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 13:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241797AbiDYRNQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 13:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4E259BE0D
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 10:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650906610;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+zADwkOp1rx0iEPsJZTq9KNCsAx16AEJ3sOA9vX0Avc=;
        b=CIp0pEY/y5LJjsWhdBRhp9BRo07gzBf0SpglDrLTiqagFgwiOpcQuQdbPaj4WaO9KOq8Zs
        5K6FbbIdUqMsWAwlPh8p6YvfacIgLo25Xr5uiwnrbzu/zHHuqMiw2zc5Ji5MkL58KLtnRN
        6V2rWRshfKE8s3JT6aHBghxXd4XWayY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-okK7TtdjNe-9GyXukHo_aA-1; Mon, 25 Apr 2022 13:10:08 -0400
X-MC-Unique: okK7TtdjNe-9GyXukHo_aA-1
Received: by mail-pg1-f198.google.com with SMTP id u5-20020a63f645000000b003aa5613d99cso9636628pgj.5
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 10:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+zADwkOp1rx0iEPsJZTq9KNCsAx16AEJ3sOA9vX0Avc=;
        b=DYkadXCUOgYr35Jwnd+Wde4hF09XXpCvEPt/Au/HJw4ZoS+2rL8W2ZHwYVkolCuixa
         DDzZh+i6Tf8GyjdRlLvKGvhPEuMxS5FYCpg44fiekmwyizCOhPTIqj1DLIhc4JLWHZ/1
         pxJ8cT3c3+m4hqyOHKTtmPTjhC1UAYHUBbk4oUhcO5EVWmoUP8Kpd4pz9LCEpoizn+nl
         wXx2MSd2A6MT9HGD+XT2k45Z2VdAEeKl3VWGLOLCu8dEfTvnsTSYFIeiglJDDuXpX5mR
         yorq7LjYMERasz2Kfh/U5qUICE80BZIPvfcg4x0aMuLW3BqJmyvBiZJWtf5xQ6dd4Plk
         tXag==
X-Gm-Message-State: AOAM530NpUTSlTqZa0zKq+Mp0fCiM9AFxifhYC2/4gzmJBYMmhNzGlPY
        W5nrEpN0BGaPEbpA5+9W7RAnr0f7RQBKs2rogFpuwCEYQge6dvtaxM4BwPRaaJFEYSqGt7dOm8d
        2KtAmRWCf/qeDFDNZdfXY6UEd+r0YNv2+rjLm
X-Received: by 2002:a17:902:c408:b0:15d:1234:3434 with SMTP id k8-20020a170902c40800b0015d12343434mr6458699plk.67.1650906607597;
        Mon, 25 Apr 2022 10:10:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHJdXp3dt7fB2uj6Ay52WTPuPVpmatBzvlTwpTaSFKBp4D0qOAyc8E07FBy7n2Kq1DgSYddBSvw6slAI6rpXA=
X-Received: by 2002:a17:902:c408:b0:15d:1234:3434 with SMTP id
 k8-20020a170902c40800b0015d12343434mr6458666plk.67.1650906607282; Mon, 25 Apr
 2022 10:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220425132315.924477-1-hadess@hadess.net> <YmarwaNQYn1GwFbQ@kroah.com>
 <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
 <Yma3k3lRMIEFypMN@kroah.com> <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
 <YmbI2UB3HwAshj8Z@rowland.harvard.edu>
In-Reply-To: <YmbI2UB3HwAshj8Z@rowland.harvard.edu>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 25 Apr 2022 19:09:56 +0200
Message-ID: <CAO-hwJ+kqjrOx2Xr+GjDPJ92hhHOt4ricHyJ9v1odj3-78k8Ug@mail.gmail.com>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 25, 2022 at 6:21 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, Apr 25, 2022 at 05:17:28PM +0200, Bastien Nocera wrote:
> > evdev, HID and USB revoke are 3 separate implementations that are
> > necessary for common device accesses to be revocable.
> >
> > The HID patch shows how device access is implemented in systemd, with
> > the seat leader (usually the compositor) being able to request fds from
> > logind if the user doesn't already have access.
> >
> > logind would then be responsible for closing the USB devices the user
> > doesn't have access to anymore when logging out, or switching user. It
> > could either close fds it passed out, or use BPF to revoke opened HID
> > and USB devices without needing to act as an intermediary.
> >
> > In short:
> > - libusb programme opens USB device, either directly, or after asking
> > the compositor to pass a fd (and being authorised to do so)
> > - programme does its thing
> > - fast user switch to another user
> > - logind revokes libusb access for the old user
> > - new user can use the device without problems
>
> What happens if there's another fast user switch back to the original
> user?  Won't the original user then expect the old usbfs fds to continue
> working?
>
> Doesn't the whole idea of revoking file access permissions go against
> the Unix philosophy of checking access rights only once, when a file is
> opened, but not thereafter?  I'm sure I've seen lots of emails by Linus
> complaining when people try to use a different approach.

Strictly speaking, it doesn't :)
Basically, when you revoke an fd, it becomes unusable, and can not be
reset to a usable state. It is as if the physical device has been
unplugged.
And when you think of it, it makes total sense to "unplug" the device
when fast user switching, for the simple reason that you might (or the
other user might) have set the device in a specific state, and when
you come back, you have no idea what the current state is.

So for end users:
- they check the permissions once on open
- fast user switching is happening, and they see the device as unplugged
- then when the session comes back they need to re-open the device and
re-initialize its state.

Cheers,
Benjamin

