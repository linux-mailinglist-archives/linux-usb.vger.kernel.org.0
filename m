Return-Path: <linux-usb+bounces-701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7097B1C0D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id BE29D1C209DC
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 12:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32AA38BCA;
	Thu, 28 Sep 2023 12:20:15 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120995386
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 12:20:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE41219E
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 05:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695903610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3smEwL+UI6+Q/2dCb7QvgQWyJ40TpMV2o0vHCJMrgA=;
	b=BiSkhXMQHbVg3Yv4HOz0uhaHZA98FvKgvVyJZz+TMwVmcLOyOF2RQbrXoQKYX8D3sTHIgi
	74HZ7IYg0j8a4GAwq9t3mG070sXmnkYAL2HV1wwT1OcJslCKnLPPmJc95LBxcRYokTPhwb
	T+CDJ2I2DW3lMzvkhbMLl6fKnatl8s8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-HDljNNOoOfupSLvy2E74Cg-1; Thu, 28 Sep 2023 08:20:09 -0400
X-MC-Unique: HDljNNOoOfupSLvy2E74Cg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5346626c1c5so4412806a12.1
        for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 05:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695903608; x=1696508408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l3smEwL+UI6+Q/2dCb7QvgQWyJ40TpMV2o0vHCJMrgA=;
        b=cNZ7KfqDSH8P6tJA2IUvW10SRe0xuAa514ENto7Hwke/0IxIt5dtZzJw+QzTjfIDP8
         kN6b7VTDFRhebAlbgCLRzyauzVhlnVSVJHuH7cSTmI8f/4qk9QfuoqGeXUJbLTNjA7KM
         chIhsLrk+y1nd5IYnjaNjSQRyQqoOaK/hAYJS7H1qF+gt2G4zFyTypPo54Nn3FySy0oh
         +oO2djtDdYeDoqSNHEnqWl7EnxRq0fp+vuT02vzIhrVvyFtpWczv2PefvEPcvwEmbYfm
         PUOlM+gupx/15s8I1/bAFTpBp3P+0P3FxFbc1LgW8XLgcgZbRHZUM1q+190OAVHWb1hF
         oqQQ==
X-Gm-Message-State: AOJu0Ywa6pS7izFOxaKV5dQ0Tvug58WG678QHIOxIIPMCM70Qi7NLIuS
	V4ffLAKn+zF1uoQVSvZExqT8Dq/NQ7t1ObNHNpf9rFTMj8MfYpYMCdIWMoBVfoMhupXg7dgA14c
	hAWOXSEpk57FuYOQA+1PP
X-Received: by 2002:a05:6402:164a:b0:52f:a44e:601d with SMTP id s10-20020a056402164a00b0052fa44e601dmr1096062edx.9.1695903608315;
        Thu, 28 Sep 2023 05:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyO5ErgFLWf8MDBzpoDNHA/Wzf+KuJdstEciFIl3FORrSyJ3myzBVY3wU2I8qm2ccDL23Nsw==
X-Received: by 2002:a05:6402:164a:b0:52f:a44e:601d with SMTP id s10-20020a056402164a00b0052fa44e601dmr1096041edx.9.1695903608017;
        Thu, 28 Sep 2023 05:20:08 -0700 (PDT)
Received: from [192.168.1.217] ([109.36.138.103])
        by smtp.gmail.com with ESMTPSA id x18-20020aa7d6d2000000b0052febc781bfsm9608018edr.36.2023.09.28.05.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 05:20:07 -0700 (PDT)
Message-ID: <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
Date: Thu, 28 Sep 2023 14:20:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
To: Oliver Neukum <oneukum@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
 Wentong Wu <wentong.wu@intel.com>
Cc: arnd@arndb.de, mka@chromium.org, lee@kernel.org, wsa@kernel.org,
 kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
 maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
 sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
 srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
Content-Language: en-US
In-Reply-To: <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

On 9/28/23 12:18, Oliver Neukum wrote:
> On 17.09.23 13:26, Hans de Goede wrote:
>  
>> Note I did not ask for a new version to be send right away, but
>> I'm afraid there has been a bit of miscommunication and instead
>> of rebasing the next version based on further review Wentong has
>> send out a new rebased version immediately, sorry about that.
> 
> Hi,
> 
> what to do now? It's been ten days.
> I am sure this driver has been very thoroughly reviewed by now.
> We are dragging this out. Do we want the developer to do another release
> or do we ask Greg to take it as is?
> This is becoming almost comical, but that is not what we want driver
> submission to be.
> 
> As far as I am concerned on the USB side everything is fine now.
> Hans? Greg?

Note I have been mostly involved in testing these patches I have
*not* thoroughly reviewed them. I have taken a quick(ish) look
which did not find anything obviously wrong.

I agree that at least patch 1/4 is ready for merging. I'm
not sure if Greg should pick-up the entire series or if
the rest should be merged through there relevant subsystems
to also give the relevant subsys maintainer tree.

For the series:

Acked-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


