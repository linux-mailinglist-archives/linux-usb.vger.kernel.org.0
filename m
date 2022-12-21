Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 533BB653710
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 20:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbiLUTfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 14:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234585AbiLUTe5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 14:34:57 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B28248D6
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 11:34:55 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id 4so16542636plj.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 11:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wxkYeI31+9VfUN7lm9EC6xwgmtRVdU6lkqSOX+doDrM=;
        b=N4IxjhzBooMBNgu41mODf55Kje77ke31iUr2Tpt6SspgfVDLWvMX4iyV6o8VhFqbWR
         3NRbnLT+g0J91KBRTAqJljQLpScHF/EtyFzv2c89FeNHBOur238FTmLZdg7QU05EZ4qv
         cOQv6V5dLiKazuJCg53eWZ1prltbWzIh4ChoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wxkYeI31+9VfUN7lm9EC6xwgmtRVdU6lkqSOX+doDrM=;
        b=o91bZRQuNy63TuqW170tsRN0d4KPKi+P51O/5wVAF0rO6om2f7gVhmt1WZFdIiZt+M
         IrHkYvglAMwIuDOGROAkuPOLuAhUoeRYFnkA3yEqQvbvZEWh6aqAsIQ4VedFadGm1s2+
         0hGeB5IJvntf+vMyozU+m3eBbDMPZDtEgu1jKwCD+iLrFOtgzugxW+2tInSy/Atj7Ijv
         mwNlV1fTzsfBqmwPEB4z26zBN0HPgmlN938BddAksDgNmJz27mMdrWbN7BZmAtvR6tJl
         gSXQ00JHdzI6ibvW+bG993s6TSbVOEgZo9GdjtvWkVifMyGvi0hiMtS95anYGCeOuCC2
         7u6w==
X-Gm-Message-State: AFqh2krzHF10Iu0kljogTfLudTfh5LCtzUMfCdUYkGvYgrTxdo+RA8/H
        8tlgCK2bQgsjUXXoPXmXz3vrYWUF/+Fs6dBSRQ0=
X-Google-Smtp-Source: AMrXdXvc9sB6xrY22xO/6odzxe0x93qO8AfRXKETX78ArARGUqac/U4LYB55+ko8HOt0xyP1BgEoog==
X-Received: by 2002:a17:903:264d:b0:189:2276:30c5 with SMTP id je13-20020a170903264d00b00189227630c5mr3080147plb.0.1671651295195;
        Wed, 21 Dec 2022 11:34:55 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id a4-20020a170902ecc400b001895d871c95sm11857578plh.70.2022.12.21.11.34.54
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 11:34:54 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id k79so11401679pfd.7
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 11:34:54 -0800 (PST)
X-Received: by 2002:a62:5e44:0:b0:576:af2d:4c4d with SMTP id
 s65-20020a625e44000000b00576af2d4c4dmr219687pfb.69.1671651293540; Wed, 21 Dec
 2022 11:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20221220-usb-dmadoc-v3-0-6009f4d27631@chromium.org> <Y6NCNLq3V4IqHp9E@rowland.harvard.edu>
In-Reply-To: <Y6NCNLq3V4IqHp9E@rowland.harvard.edu>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 21 Dec 2022 20:34:42 +0100
X-Gmail-Original-Message-ID: <CANiDSCvRBX-g17ThOb=kcQ=JFmxoeicBXzg=3fqy3cARKhXBDw@mail.gmail.com>
Message-ID: <CANiDSCvRBX-g17ThOb=kcQ=JFmxoeicBXzg=3fqy3cARKhXBDw@mail.gmail.com>
Subject: Re: [PATCH v3] USB: Improve usb_fill_* documentation
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Christoph Hellwig <hch@lst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan

On Wed, 21 Dec 2022 at 18:28, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, Dec 21, 2022 at 11:15:14AM +0100, Ricardo Ribalda wrote:
> > Document the transfer buffer requirement. That is, the buffer must be
> > DMAble - otherwise data corruption might occur.
> >
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > USB: Improve usb_fill_* documentation
> >
> > After trying to "cleanup" the uvc code, I was patiently explained about
> > the requirements of the urb transfer buffers.
> >
> > Lets make this explicit, so other developers do not make the same mistake.
> >
> > To: Bagas Sanjaya <bagasdotme@gmail.com>
> > To: Randy Dunlap <rdunlap@infradead.org>
> > To: Alan Stern <stern@rowland.harvard.edu>
> > To: Christoph Hellwig <hch@lst.de>
> > To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > Changes in v3:
> > - Improve commit message. Thanks Bagas!
> > - Improve field description. Thanks Alan!
> > - Link to v2: https://lore.kernel.org/r/20221220-usb-dmadoc-v2-0-4dd4f198113e@chromium.org
> >
> > Changes in v2:
> > - s/allocatiing/allocating/ Thanks Randy
> > - Link to v1: https://lore.kernel.org/r/20221220-usb-dmadoc-v1-0-28386d2eb6cd@chromium.org
> > ---
> >  include/linux/usb.h | 27 +++++++++++++++++++++++----
> >  1 file changed, 23 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 7d5325d47c45..06cde9ddca97 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -1626,14 +1626,25 @@ struct urb {
> >   * @urb: pointer to the urb to initialize.
> >   * @dev: pointer to the struct usb_device for this urb.
> >   * @pipe: the endpoint pipe
> > - * @setup_packet: pointer to the setup_packet buffer
> > - * @transfer_buffer: pointer to the transfer buffer
> > + * @setup_packet: pointer to the setup_packet buffer. The buffer must be
> > + *   suitable for DMA.
> > + * @transfer_buffer: pointer to the transfer buffer. The buffer must be
> > + *   suitable for DMA.
> >   * @buffer_length: length of the transfer buffer
> >   * @complete_fn: pointer to the usb_complete_t function
> >   * @context: what to set the urb context to.
> >   *
> >   * Initializes a control urb with the proper information needed to submit
> >   * it to a device.
> > + *
> > + * The transfer buffer and the setup_packet buffer will most likely be filled
> > + * via DMA.
>
> No, no!  The setup_packet buffer will never be filled via DMA -- it is
> _read_ via DMA.
>
> The transfer buffer may be filled via DMA; it depends on the direction
> of the transfer.  For OUT transfers, the buffer is read via DMA; for IN
> transfers it is filled via DMA.

I tried to have a short sentence :), but you are right, let's make it
explicit, at the end of the day that is the whole purpose of this
patch :)

I have written now: will most likely be filled or read via DMA.

>
> > The simplest way to get a buffer that can be DMAed to is
> > + * allocating it via kmalloc() or equivalent, even for very small buffers.
> > + * If the buffers are embedded in a bigger structure, there is a risk that
> > + * the buffer itself, the previous field and/or the next field are corrupted
> > + * due to cache incoherencies; or slowed down if they are evicted from the
> > + * cache.
> > + *
> >   */
> >  static inline void usb_fill_control_urb(struct urb *urb,
> >                                       struct usb_device *dev,
> > @@ -1658,13 +1669,17 @@ static inline void usb_fill_control_urb(struct urb *urb,
> >   * @urb: pointer to the urb to initialize.
> >   * @dev: pointer to the struct usb_device for this urb.
> >   * @pipe: the endpoint pipe
> > - * @transfer_buffer: pointer to the transfer buffer
> > + * @transfer_buffer: pointer to the transfer buffer. The buffer must be
> > + *   suitable for DMA.
> >   * @buffer_length: length of the transfer buffer
> >   * @complete_fn: pointer to the usb_complete_t function
> >   * @context: what to set the urb context to.
> >   *
> >   * Initializes a bulk urb with the proper information needed to submit it
> >   * to a device.
> > + *
> > + * Please refer to usb_fill_control_urb() for a description of the
> > + * requirements for transfer_buffer.
>
> _This_ right here is the kerneldoc for usb_fill_control_urb()!  You
> should have written "Please refer to the kerneldoc for struct urb".
>

Please try applying the patch. I believe it is on the right location.
diff does not know about kerneldoc and this is why it copies the
previous header (struct urb), instead of usb_fill_control_urb.

This is why it seems that all the messages are shifted one location up.

I would also prefer to keep the: refer to usb_fill_control_urb, as the
functions are more indexed than the structures: Eg:
https://manpages.debian.org/testing/linux-manual-4.8/usb_fill_control_urb.9.en.html

What about adding a reference to struct urb at usb_fill_control_urb() ?



> >   */
> >  static inline void usb_fill_bulk_urb(struct urb *urb,
> >                                    struct usb_device *dev,
> > @@ -1687,7 +1702,8 @@ static inline void usb_fill_bulk_urb(struct urb *urb,
> >   * @urb: pointer to the urb to initialize.
> >   * @dev: pointer to the struct usb_device for this urb.
> >   * @pipe: the endpoint pipe
> > - * @transfer_buffer: pointer to the transfer buffer
> > + * @transfer_buffer: pointer to the transfer buffer. The buffer must be
> > + *   suitable for DMA.
> >   * @buffer_length: length of the transfer buffer
> >   * @complete_fn: pointer to the usb_complete_t function
> >   * @context: what to set the urb context to.
> > @@ -1697,6 +1713,9 @@ static inline void usb_fill_bulk_urb(struct urb *urb,
> >   * Initializes a interrupt urb with the proper information needed to submit
> >   * it to a device.
> >   *
> > + * Please refer to usb_fill_control_urb() for a description of the
> > + * requirements for transfer_buffer.
>
> Similar to the above.
>
> > + *
> >   * Note that High Speed and SuperSpeed(+) interrupt endpoints use a logarithmic
> >   * encoding of the endpoint interval, and express polling intervals in
> >   * microframes (eight per millisecond) rather than in frames (one per
>
> Why didn't you also make the same change to usb_fill_int_urb()?
>
> Alan Stern
>
> >
> > ---
> > base-commit: b6bb9676f2165d518b35ba3bea5f1fcfc0d969bf
> > change-id: 20221220-usb-dmadoc-29384acebd48
> >
> > Best regards,
> > --
> > Ricardo Ribalda <ribalda@chromium.org>



-- 
Ricardo Ribalda
