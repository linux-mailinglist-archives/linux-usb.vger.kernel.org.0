Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701876E59EF
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 08:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbjDRG4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 02:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbjDRG4n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 02:56:43 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 143FE6594
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 23:56:32 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-32a7770f7d1so29171915ab.1
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 23:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681800991; x=1684392991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7o29o/kWlSHz2S+kD8JzTo5IidYiXD9HcuZ2r5W/nqU=;
        b=SKbpk2OAro7TzLYtYYWvWgmukB1PFSonlcL11edjFIFFFsWoyAr1022gY4QpHlKIoj
         79i1wEe4HdETqOpgiBnmHX0iljYy3myULWDW+6I3AT/oRZYoEj4KGwG46wsTqy3nLsfL
         JdEhgtg+aSstCoRYcYX1KoEnPiAIdPJZaEyKxmETMjeMlOkDYpbWDPEh4j2TazDpsmsf
         +5JfHRpXg/M3R7Jd/H081kOEsymzPmjFNu8xkcebKkP81HMWRRlo5vVDLQjbnDtA1I8g
         vJeqI+8Yo1VX8H4QxXrcIaiXP5C/jl4RH1JQFZVA+jmn90rZPHztNAUmQ9QJMDpl8J+g
         RInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681800991; x=1684392991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7o29o/kWlSHz2S+kD8JzTo5IidYiXD9HcuZ2r5W/nqU=;
        b=fjZg3AC3l3DTRg+kXS0W28Tht1eiTdxqoo9BxcLFQrjHrCoahHk1sDwuxwcrwlLFEA
         eFni7YXfRJQNauRxBcfavAbowEUB8BvlFearwCZBHrVbwWJrgGwVEoDUVsyutMxRF+zg
         /vnOjIIeGRF5R+jADbZXBWuXHqmTKWbauintINj6kFCaZjYEN2wFgXBxeIHyyO3qzyj/
         vVcWn+g6idlNF0hcPrSybmCd4iXjHVBqaKoDXaaZBuZ6B0xiotljwJLGIXKHShI9jJzb
         Bq22tAE+jQ/qF7WvZQfVgiBzkWvZ7nlpY/6+Yc2+hNQ96RxHBZ60k1v9vTV9/CQyDm3b
         /D8Q==
X-Gm-Message-State: AAQBX9e4IUHT5z2ennjZX/xEt08uNaUNuXffMmzzLVdntHoMzMDrfezi
        d7Pe42Lm5kNo0raP7I4ch9IVeRDIZjHFuLcJJwxbSw==
X-Google-Smtp-Source: AKy350Yf+VIUzcw4xiPt1DmS2M2gj7OOUX4lf2Vpk+4PPaykBCqKDYhq0RQpSM08jF0UM4HRIgSgH7Wc+kdw6hh7n68=
X-Received: by 2002:a6b:1452:0:b0:760:e776:18c0 with SMTP id
 79-20020a6b1452000000b00760e77618c0mr970453iou.9.1681800991234; Mon, 17 Apr
 2023 23:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMHf4WKbi6KBPQztj9FA4kPvESc1fVKrC8G73-cs6tTeQby9=w@mail.gmail.com>
 <ZD1ObUuy8deAvupf@kroah.com> <3a9ee93a-b0ec-ac92-77ab-2956c1c4f434@google.com>
 <20230418024937.h6mipfdvdqomtz36@synopsys.com>
In-Reply-To: <20230418024937.h6mipfdvdqomtz36@synopsys.com>
From:   Avichal Rakesh <arakesh@google.com>
Date:   Mon, 17 Apr 2023 23:56:20 -0700
Message-ID: <CAMHf4WKzU7uWj5HVHdcBnJ2ugK5cfkk=-38dn7=z1fCwXtegLw@mail.gmail.com>
Subject: Re: UVC Gadget Driver shows glitched frames with a Linux host
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jayant Chowdhary <jchowdhary@google.com>,
        "Eino-Ville Talvala (Eddy)" <etalvala@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 17, 2023 at 7:49=E2=80=AFPM Thinh Nguyen <Thinh.Nguyen@synopsys=
.com> wrote:
>
> On Mon, Apr 17, 2023, Avichal Rakesh wrote:
> >
> > On 4/17/23 06:49, Greg KH wrote:
> > > On Fri, Apr 14, 2023 at 02:03:02PM -0700, Avichal Rakesh wrote:
> > >
> > >> This problem may be further exaggerated by the DWC3 controller drive=
r
> > >> (which is what my device has) not setting the IMI flag when
> > >> no_interrupt flag is set
> > >> (https://urldefense.com/v3/__https://lore.kernel.org/all/ced336c8443=
4571340c07994e3667a0ee284fefe.1666735451.git.Thinh.Nguyen@synopsys.com/)?__=
;!!A4F2R9G_pg!fB0krUX6qsOXrBsOHzLstVFWqTLL9ncwGFXxlxK0eedLY_29XdwjXRtbO-EWv=
1eX5okN1rOeBZspZ21KSb5b$
> > >> UVC Gadget Driver sets the no_interrupt flag for ~3/4 of its queued
> > >> usb_request, so an ISOC failure may not immediately interrupt the UV=
C
> > >> gadget driver, leaving more time for the frame to finish encoding.
> > >>
> > >> I couldn't find any concrete error handling rules in the UVC specs, =
so
> > >> I am not sure what the proper solution here is. To try out, I create=
d
> > >> a patch (attached below) that dequeues all queued usb_requests from
> > >> the endpoint in case of an ISOC failure and clears the uvc buffer
> > >> queue. This eliminated the partial frames with no perceivable frame
> > >> drops.
> > >>
> > >> So my questions here are:
> > >> 1. Is this a known issue, and if so are there workarounds for it?
> > >> 2. If the answer to above is "No", does the explanation and mitigati=
on
> > >> seem reasonable?
> > >>
> > >> Patch follows (mostly for illustration, I can formalize it if
> > >> needed!). It adds a new 'req_inflight' list to track queued
> > >> usb_requests that have not been given back to the gadget driver and
> > >> drops all the queued requests in case of an ISOC failure. The other
> > >> changes are for the extra bookkeeping required to handle dropping al=
l
> > >> frames. I haven't been able to confirm it, but as far as I can tell
> > >> the issue exists at ToT as well.
> > >>
>
> Perhaps this conversation with Jeff may explain the issues you observed:
> https://lore.kernel.org/all/20221021164349.fft4yqnxuztsqdeu@synopsys.com/
>
> To summarized the long conversation, the UVC needs to maintain a
> constant queue of usb requests. Each request is scheduled for a specific
> interval. If the UVC couldn't keep up feeding requests to the
> controller, then we will have stale requests and missed isoc.
>
> From the discussion and review, the UVC couldn't queue requests fast
> enough. The problem is exacerbated when you reduce the interrupt
> frequency with no_interrupt setting. The dwc3 driver has some basic
> mechanism to detect for underrun by checking if the queue is empty, but
> that's not enough to workaround it.
>
> Your suggestion to dequeue the request would mean the controller driver
> will reschedule the isoc transfer again, which reschedule the next
> request for a new interval (potentially avoid being stale). That's fine,
> but that may not be a great solution because we're still playing catch
> up and the missed isoc already happened.
>
> You may try to do the followings to mitigate this issue:
> 1) Make sure UVC to only queuing rate is constant. Perhaps queue dummy
>    requests in between time gaps if need be?
>
This is extremely helpful, thank you! I have a somewhat basic
question: For an isoc request, is its "freshness" determined from the
time at which usb_ep_queue is called, or from the time at which the
previous request was transferred to the host? If the "freshness" is
determined from the time 'usb_ep_request' was called, I wonder if the
"underrun" is artificial because UVC Gadget driver pumps all free
usb_requests at once, and then waits around doing nothing while the
usb_requests get stale in the controller's queue. In this case, just
slowing the encode loop to wait a little before queuing more requests
should do effectively what you suggest above?

> 2) Enhance dwc3 to detect underrun from UVC on request queue. ie. If the
>    queue is empty and a new request is queue, reschedule the isoc transfe=
r.
>    This will break some other devices if time guarantee is required. So
>    perhaps an additional flag is needed for this change of behavior.
>

I am not as familiar with the DWC3, but just to clarify: Is your
suggestion to reschedule the stale requests if the controller's send
queue is empty (underrun) and the UVC gadget driver queues a new
request? Depending on how many stale requests there are, would that
run the risk of timing out the new request as well?

> BR,
> Thinh

Best
Avi
