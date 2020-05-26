Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174311CE29A
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 20:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbgEKS1V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 14:27:21 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:37202 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731028AbgEKS1U (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 14:27:20 -0400
Received: by mail-oi1-f193.google.com with SMTP id r25so15965797oij.4;
        Mon, 11 May 2020 11:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VnDVXODMrSuBUynBLZ2vD//e4JWl2ZZnhBhHzSJKxpk=;
        b=P3MrAuGfnnd0DZdgtPEZEgjlQj5hkgFyOJShojWU4oE60S3lOBTe6Xyl8UWwBDLkpz
         p0WCShPpddttyBKgtubu6hSmwVyktVjJevT6tbDH2LnCCuzVJTA+NGFWZPFgLF1+L7SX
         o4SVLLU8THVKcCYh50hDoPtOp/rbyEDYKuRl1kVXNMAi0Hs+AsfsLMWCLh/Nphkx+Lj+
         nooJVomxRWnzwKqT1XTGYjvgtZXWY4ipKwId70CwedCeY0gw6thNeVLsg8dS8Z9rxNdC
         BqPW+r+dUgt4wM9m97ClfTdeBoAdajRloTcm/QrEk35GqncwwUyRSgZFDhIBhKBKHKXd
         aw+A==
X-Gm-Message-State: AGi0Pua5kiF0gRPOp2K+0rCOnYGqnzHijsO/9TczWlkfiGIDrKdjtK0/
        Q5NOMigYlgCuxVTJ9sp+Bw==
X-Google-Smtp-Source: APiQypJjhFM4wDlm69yPql7xC9Gfrg0xTT+8CFFRWUQT66HfRY0DoEtoUmKzUox2WFQNwSKROeUGEQ==
X-Received: by 2002:a05:6808:3d4:: with SMTP id o20mr19556684oie.47.1589221639554;
        Mon, 11 May 2020 11:27:19 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f25sm536810ooj.20.2020.05.11.11.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:27:18 -0700 (PDT)
Received: (nullmailer pid 23990 invoked by uid 1000);
        Mon, 11 May 2020 15:26:49 -0000
Date:   Mon, 11 May 2020 10:26:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Angus Ainslie <angus@akkea.ca>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,tps6598x: add dt binding doc
Message-ID: <20200511152649.GA23481@bogus>
References: <20200506191718.2144752-1-angus@akkea.ca>
 <20200506191718.2144752-3-angus@akkea.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506191718.2144752-3-angus@akkea.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed,  6 May 2020 12:17:18 -0700, Angus Ainslie wrote:
> Document the tps6598x driver
> 
> Signed-off-by: Angus Ainslie <angus@akkea.ca>
> ---
>  .../devicetree/bindings/usb/ti,tps6598x.yaml  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml: maintainers:0: None is not of type 'string'
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/usb/ti,tps6598x.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/usb/ti,tps6598x.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml: ignoring, error in schema: maintainers: 0
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/ti,tps6598x.yaml: ignoring, error in schema: maintainers: 0
warning: no schema found in file: ./Documentation/devicetree/bindings/usb/ti,tps6598x.yaml
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1284704

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

