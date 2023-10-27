Return-Path: <linux-usb+bounces-2281-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C97847D9951
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 15:07:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6753B1F22D57
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C38A1DDE1;
	Fri, 27 Oct 2023 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSGns7Tj"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA219BA9;
	Fri, 27 Oct 2023 13:07:25 +0000 (UTC)
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC82129;
	Fri, 27 Oct 2023 06:07:22 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2800dfa0dd6so502186a91.1;
        Fri, 27 Oct 2023 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698412042; x=1699016842; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VTm3HKZDTpXr+VU+k3Pt24Lznstzm73j1R8bDymP3Wk=;
        b=GSGns7Tjf7fucutgLUDFZO19+W0BO6jw7n3tFqNSQ29uSY0TzPv3TqU2wnYcgogKpv
         ceRSiHmBmXSV8P+uLRfSfuGTKdzX3Lvn8FsMDu/61EH6sVP8Llquqct6WP8W8oU8+FM4
         xwEDeRNCo50y3CLtLzsUm2zLq7QsRgmdeMp7CuumYBE7UeqdB20n2kLAf32V32EVwpY5
         CO49pFBLFO0m8UBpeP3ft/ggBQdk468bQZc5i+WOUa2FEMQ44Ui9WY9N1WUgospAZaky
         SrFuveYxLfPH4Nr5lE3OlJAawHe0GSDfJLwH9RQalsSHfw3wzisHfKGCS9t6vLmpzw00
         SZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698412042; x=1699016842;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTm3HKZDTpXr+VU+k3Pt24Lznstzm73j1R8bDymP3Wk=;
        b=gTmqSvPn1s14mnDoHxjemozk4pMuFUrY0i5gIb0vS/wu2bhlD9e+V8KZl1WI6SrP6/
         Upim8ku/AVZ4E5CPaJxHMwQWb3qcC2Rb/H0nQX+K01TkRe7ecNR1X9FGB63IiSInV4jS
         +9gIDi+wQN6gtoxUHv6lmFlPgDG24SxzVEUAPk2aLVPuZxHhLS46/MYq/dtT3xqv6RTG
         oPq1/vJw44RwsLmGfHiXYcROvIAstg1Ej6wjdDsvXIs36TzOVu1eZHYAJxf0LHUMkDtO
         R2Bx82HS7izskXR7jnGJZ/pe8bZhBu+liVQfZD0WQhE6C7aIQSPflsz83n+wAQrR8St0
         pb5w==
X-Gm-Message-State: AOJu0Yxi5x9MAWd0nLsfmkG9y4Cy/Leqaw8REpaiOhs65dysjddLS8xV
	jsldcGYaX8+onKfjp40tO2s=
X-Google-Smtp-Source: AGHT+IF15Rq+MqE77offCAjFJQ4Arvms17cTaQ5u6/PwZPez6e80HdF17UnZWYX0sssEBRHCfqPf+w==
X-Received: by 2002:a17:90a:357:b0:27d:5964:4eec with SMTP id 23-20020a17090a035700b0027d59644eecmr2455669pjf.1.1698412040581;
        Fri, 27 Oct 2023 06:07:20 -0700 (PDT)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090a348d00b002609cadc56esm1326781pjb.11.2023.10.27.06.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 06:07:20 -0700 (PDT)
Message-ID: <25158cfc-5a8f-4419-b1ca-08743277ee23@gmail.com>
Date: Fri, 27 Oct 2023 10:07:14 -0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/2] samples: rust: Add USB sample bindings
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20231027003504.146703-1-yakoyoku@gmail.com>
 <20231027003504.146703-3-yakoyoku@gmail.com>
 <2023102737-juniper-trodden-afb4@gregkh>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <2023102737-juniper-trodden-afb4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/23 04:15, Greg Kroah-Hartman wrote:
> On Thu, Oct 26, 2023 at 09:34:51PM -0300, Martin Rodriguez Reboredo wrote:
>> [...]
>> +
>> +config USB_RUST
>> +	bool "Rust USB bindings"
>> +	depends on USB && RUST
>> +	default n
> 
> Nit, "n" is the default, this line is not needed.
> 
> Also, if you want to get really picky, _which_ USB is this for, the
> "host" apis (you plug a USB device into a Linux maching), or the
> "gadget" apis (i.e. Linux is running in the device that you plug into a
> USB host)?  Linux supports both :)

Nice one! I'll probably target host APIs as of now due to what I have in
my hands.

>> +	help
>> +	  Enables Rust bindings for USB.
>> [...]
>> +//! Rust USB sample.
>> +
>> +use kernel::prelude::*;
>> +
>> +module! {
>> +    type: UsbSimple,
>> +    name: "rust_usb_simple",
>> +    author: "Martin Rodriguez Reboredo",
>> +    description: "Rust USB sample",
>> +    license: "GPL v2",
>> +}
>> +
>> +struct UsbSimple;
> 
> "USBSimple" please.
> 
>> +
>> +impl kernel::Module for UsbSimple {
>> +    fn init(_module: &'static ThisModule) -> Result<Self> {
>> +        pr_info!("usb enabled: {}", !usb::disabled());
>> +        Ok(UsbSimple)
>> +    }
>> +}
> 
> I know this is just a fake patch to test the bindings logic, so sorry
> for the noise, just wanted to get terminology right :)
> 
> thanks,
> 
> greg k-h

No, you are right. Because Rust uses upper camel case for struct names
there's the tendency of lowering initialisms, so you can either leave it
as `USBSimple` or as `UsbSimple`. When I publish my USB host bindings
I'll take your comment into account for sure.

