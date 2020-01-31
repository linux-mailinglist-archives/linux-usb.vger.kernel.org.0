Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042FA14F30B
	for <lists+linux-usb@lfdr.de>; Fri, 31 Jan 2020 21:06:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgAaUGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Jan 2020 15:06:46 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33483 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgAaUGp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Jan 2020 15:06:45 -0500
Received: by mail-ot1-f68.google.com with SMTP id b18so7797425otp.0;
        Fri, 31 Jan 2020 12:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AbO+gon8QEJiqD6b6PW0TmWlbcPnG39Yyju/1Ptva7A=;
        b=CSFqi4tWPaGCbRL0rt5X2fhm9yGQMfmvSL6nWVICdsp2h/l96m1f8GJ2T96+toxDDv
         VMoaAGvZasdDKkHS61oc3FyOW0c6hTNagf1Wwiuzti12QKXwqqNEli2vroYN6YoGjbqc
         MJ/MLULi4S/RteItU7U0vI5rfewj/15Shd1wgwHU4qRpmYsPZDKRRDsayLyuem3ijCtL
         Kvm5Wxau/giI3DpMdNoV070ei21PYqbw6RmCgI6+bOc7sB0hVxKdMhGW67EqD+bjnVOP
         i7TVjX4EW7TgThcbtcSfIIbenaKbi4W7wdkquaEeWixNgzH8c9nDuU7gCDPajcddApFE
         PIrw==
X-Gm-Message-State: APjAAAXxrdE20HqQ8nNplB5tYdORDxjoTT1Hd7M7JuwGnbb5TfF6/zom
        SYXawu7CSZAiVQRKdYnB4g==
X-Google-Smtp-Source: APXvYqypW7CmmlNjveScb/uhps8dAYhHTYKvur2n/FPc2Yr0pzCb4xGJ80xks8YoGnMim8R/3fHxsg==
X-Received: by 2002:a9d:1706:: with SMTP id i6mr9325576ota.151.1580501203331;
        Fri, 31 Jan 2020 12:06:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w201sm2978724oif.29.2020.01.31.12.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 12:06:42 -0800 (PST)
Received: (nullmailer pid 26745 invoked by uid 1000);
        Fri, 31 Jan 2020 20:06:41 -0000
Date:   Fri, 31 Jan 2020 14:06:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Amelie DELAUNAY <amelie.delaunay@st.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Fabrice Gasnier <fabrice.gasnier@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc2: add support for STM32MP15
 SoCs USB OTG HS and FS
Message-ID: <20200131200641.GA24534@bogus>
References: <20200124084131.23749-1-amelie.delaunay@st.com>
 <20200124084131.23749-2-amelie.delaunay@st.com>
 <87imkr7nou.fsf@kernel.org>
 <c29867bd-8056-a82f-2273-101470395e78@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c29867bd-8056-a82f-2273-101470395e78@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 31, 2020 at 05:13:25PM +0100, Amelie DELAUNAY wrote:
> Hi,
> 
> On 1/31/20 2:36 PM, Felipe Balbi wrote:
> > Hi,
> > 
> > Amelie Delaunay <amelie.delaunay@st.com> writes:
> > 
> > > Add the specific compatible string for the DWC2 IP found in the STM32MP15
> > > SoCs.
> > > STM32MP15 SoCs uses sensing comparators to detect Vbus valid levels and
> > > ID pin state. usb33d-supply described the regulator supplying Vbus and ID
> > > sensing comparators.
> > > 
> > > Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> > 
> > This doesn't apply. dwc2 bindings is still in .txt format. I have taken
> > patch 2, though.
> > 
> 
> Thanks for taking driver patch.
> 
> Rob, would you mind to take patch 1 (Yaml binding update) in your tree ?

Done.

Rob
