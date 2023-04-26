Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 208A86EEDF8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 08:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239393AbjDZGFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 02:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjDZGFl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 02:05:41 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579B82134
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 23:05:40 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-18b5c8c2a49so4143819fac.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682489139; x=1685081139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V4i0azaBg7O2s6i4lwA15XawiNtASRWPXQ/VuKlA5y4=;
        b=DZGRz3tSKIM2yXRQmQejA1m9L1rhn9ngygTpxg2tEEFW4UHsFzpizqKNaC0i5ZMsB9
         Wf/6DqLPtTBZ4UCIRcvDMsFtPExPvuKsnYn4cl/6V09kaJV2b7KuHdAPGGqg14Ba71/6
         BFWTSJonGZp1HtMPI1LRPuGCoo2jkqSoTJXpGZNE3wZ7HumZfFY99/gKVhgH013dnqpa
         nZ2Cbhare84sYNoDNaIBkyN42makDPewKDVUGI4hghhDjUhSx8Xy0dU4GyjX9CEfs6XQ
         sTA+nSvekL+Jt0zR4FcB2ITzZUnEPY6BM7l6Wqgl7RNiQBycHPo/lYgkYZcV40J35XI0
         nQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682489139; x=1685081139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4i0azaBg7O2s6i4lwA15XawiNtASRWPXQ/VuKlA5y4=;
        b=a+ziQ9nnc18gt5JDQ2niDQ/Z7ozIDbO1rd5qtlGGFMNqv0pOKvSuS3NBZn9VgW2eK1
         oIbSfUMW8CXEq0uKV5LoXFbEsLR+Ys2QIsoBuKOCe32MUwJ37a/nJcfHJVplMZ1fv35y
         oE51a/ZlzR0cANI8LhMPYnsPT9Ut3Bj3ThoP9PxX4m/e7V5xPdWKxsPRHNEIvKMXrs7p
         Cb2QuZNJU22+sjVsJF+9veDPWrYT9LD4JwtOrvV9ycqPq6bB/Oz0nGxZzEyoUcq1XtzI
         hYXPeXSNL2sKBcIj49Vp1qnvoxL1iY0rVosln8XDWDRtLxeLjhg8ABvF9p9vq8yZs9jU
         WFTA==
X-Gm-Message-State: AAQBX9fNYN9wS1T4fpFR2Jw9gzZyYywc7RndKhl/6LIbf6ioLEo8M63k
        SFkwTs/H1OEAQtMmShH0i3hbR2/8TIgLN4z6vhU=
X-Google-Smtp-Source: AKy350ZHxqPcx48WmgJoNKk72NuAnR2wRNBXtbnH/rNu5oApfZDn4ef/OFrMfGVEPtbRYNXgZGn/UQ==
X-Received: by 2002:a05:6870:8a11:b0:184:6a66:fd9e with SMTP id p17-20020a0568708a1100b001846a66fd9emr11813434oaq.8.1682489139578;
        Tue, 25 Apr 2023 23:05:39 -0700 (PDT)
Received: from geday ([2804:7f2:8006:a502:65e3:3fd9:3321:ba17])
        by smtp.gmail.com with ESMTPSA id p22-20020a05687052d600b0017243edbe5bsm6280115oak.58.2023.04.25.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 23:05:39 -0700 (PDT)
Date:   Wed, 26 Apr 2023 03:05:53 -0300
From:   Geraldo Nascimento <geraldogabriel@gmail.com>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Jakub Kicinski <kuba@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        regressions@lists.linux.dev
Subject: Re: USB sound card freezes USB after resume from suspend
Message-ID: <ZEi/QWRlJetMZ2R9@geday>
References: <20230425111924.05cf8b13@kernel.org>
 <87pm7rtdul.wl-tiwai@suse.de>
 <ZEi6x155vF5GLeXT@geday>
 <87mt2vtc31.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt2vtc31.wl-tiwai@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 26, 2023 at 08:02:58AM +0200, Takashi Iwai wrote:
> On Wed, 26 Apr 2023 07:46:47 +0200,
> Geraldo Nascimento wrote:
> > 
> > Hello Jakub and Takashi,
> > 
> > On Wed, Apr 26, 2023 at 07:24:50AM +0200, Takashi Iwai wrote:
> > > On Tue, 25 Apr 2023 20:19:24 +0200,
> > > Jakub Kicinski wrote:
> > > > 
> > > > Hi!
> > > > 
> > > > For a few weeks now I can't use any USB devices if I suspend my laptop
> > > > with my USB sound card active and resuming it without it connected.
> > 
> > Takashi, did you pay attention to the workflow of triggering Jakub's
> > bug? He suspends the computer with the sound card active, disconnects
> > the sound card and expects to resume his computer back to an usable
> > state.
> 
> It's a pretty normal procedure for many people; most of USB type-C
> docks have a USB audio built-in, and people remove the machine from
> the dock after suspend.  So that's an operation that is seen everyday
> everywhere.
> 
> Still I haven't heard this issue, and it implies that it's either
> something new or specific to the machine or the environment.  Or we've
> been just lucky...
> 
> 
> Takashi

Understood, sorry for adding noise then.

Thanks,
Geraldo Nascimento
