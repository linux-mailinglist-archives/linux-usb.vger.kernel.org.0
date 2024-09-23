Return-Path: <linux-usb+bounces-15266-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2297D3C9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 11:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66471C21698
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 09:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9543413AD26;
	Fri, 20 Sep 2024 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+XX9bqJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEAC7E591
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726825141; cv=none; b=j8DpVFhZBuliQsdH9VEeT0c7ibD6jkz4P+EJ03iUJwbFE3bQMgbPHYzvQGFWEC5qfoZndjxQV3xPhH2HPeG7vUsQv3Cir+56+iBc/G1qibPPTIQiRWNKnRy7HVta7RcS8lrztk6Z2Z4bfmU5rZoz50VK9zTOIppYn1E63S1VARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726825141; c=relaxed/simple;
	bh=j591OMxZW91/nUKO/svkLkwNmZBlVOlaT9CaWA6kncE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJ5xDWAvgpTvgzXNUY2ba2ifFSopaOu8lfOpmI42mKK9YS/VeLJowTeXUcSUkVeFQmfIemdH8jlfe77aDw4DUseGywpz+3/cmHyzUbzCv5ukh4DxUv6o/ENpibcbxdQUXSDE8qk/KbxOaTbApDO9BvWc6KnJnqJnlGCPZcazbOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+XX9bqJ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53653682246so2024667e87.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 02:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726825137; x=1727429937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Isga6WhNpBJPKKZLFSzZ37SuHnie4715ui4RDqxHIU=;
        b=X+XX9bqJUNLGAbQFnk7WgsRkoEKMsN2joHRyCFOw5zKvmtSQT/USMY0OhvEUF8G3XC
         QCTK6PqIghKMMk3p0JvWpm7cOCxY9Dw2ECdzXGGSLajm4gFLBtSp3KKCkun6bKXLLkQd
         ISdl9rNsmZuI/ZFr8rMcTS7Udzbbh2XSavT07lXL4qGNB+0R8zGOYSLkQLR9Sj0LIqoK
         QesJexlImB/zmrB5z8sHxINtlaApMmpIEXEUzzdjuJd8+Aq2lnNSvli6lR3JesGql0lU
         mvvy/YTHJs/gxof9orOxz5rPVYvB7kNCDVFzHYMMAtKVLwo2hbqkVJSIQwp+o4hcF/xC
         IABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726825137; x=1727429937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Isga6WhNpBJPKKZLFSzZ37SuHnie4715ui4RDqxHIU=;
        b=PvcjrR3g4RUN4tlD2JwPBOTcZhHVe3Cdb+OiaHM3t+Pk6MNzxpQ6+oQP6fBG+OiDyE
         FfL1zBL55f6NCN80dnsxIW+rmDHAVk1xmfz8gheAkD8KxfXiywakXZtQmEQVHPJP2lmY
         sA/RmiGn4pTmvCSJbX0wQCebMzlWZSQxR7RijNprvgLLS5xvpJBjNZXdJ60JMZi9+5zN
         zGtZ+/3kHVY+PwrFOGeQBJDPFeFZ6FM/iCW1WfrcjOnD0cKm1H156GSi5rn9PNztiSZi
         CrjV6B5CB3jqqNCAXUXcFfxt8U6GyNekd723Ql06OIAZGtCNso4A3ZqrZsvR3RMNDuWR
         OBvg==
X-Forwarded-Encrypted: i=1; AJvYcCX8kWBg8MbKVunJ+TLAWDGc79bflXCcuQk4Ldb67jnHbHpBwbYdWzr5jgy4LGCa4A4rAsqtfJ3zkVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP6Zd3TlUAEvSsklmkHTqSGSjgW8B6iMY/Z23LCOT9aNdfila1
	Z3ep6l/dIK2+D8ivMfswI2LtyIcfFrkZGhpl4VVmawJjuTJnl9bhabizGIBNCnk=
X-Google-Smtp-Source: AGHT+IEyf+L3alOBO+IDE5tXohIeKgqQE+M9l4Enih5DCS15gfbRAxlZH2hDf1Cm6A3BQnla8U5uuQ==
X-Received: by 2002:a05:6512:3d91:b0:533:3268:b959 with SMTP id 2adb3069b0e04-536ac33b3afmr1366248e87.53.1726825136859;
        Fri, 20 Sep 2024 02:38:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53687096859sm2077814e87.176.2024.09.20.02.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 02:38:56 -0700 (PDT)
Date: Fri, 20 Sep 2024 12:38:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
	Guenter Roeck <groeck@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
Message-ID: <phdcjgqqpjpruxp7v2mw446q73xr3eg4wfgfbjw5tasgr2pgg2@77swbk47b2tg>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-16-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901040658.157425-16-swboyd@chromium.org>

On Sat, Aug 31, 2024 at 09:06:53PM GMT, Stephen Boyd wrote:
> Add a DT graph binding to google,cros-ec-typec so that it can combine
> DisplayPort (DP) and USB SuperSpeed (SS) data into a USB type-c endpoint
> that is connected to the usb-c-connector node's SS endpoint. This also
> allows us to connect the DP and USB nodes in the graph to the USB type-c
> connectors, providing the full picture of the USB type-c data flows in
> the system.
> 
> Allow there to be multiple typec nodes underneath the EC node so that
> one DT graph exists per DP bridge. The EC is actually controlling TCPCs
> and redrivers that combine the DP and USB signals together so this more
> accurately reflects the hardware design without introducing yet another
> DT node underneath the EC for USB type-c.
> 
> If the type-c ports are being shared between a single DP controller then
> the ports need to know about each other and determine a policy to drive
> DP to one type-c port. If the type-c ports each have their own dedicated
> DP controller then they're able to operate independently and enter/exit
> DP altmode independently as well. We can't connect the DP controller's
> endpoint to one usb-c-connector port@1 endpoint and the USB controller's
> endpoint to another usb-c-connector port@1 endpoint either because the
> DP muxing case would have DP connected to two usb-c-connector endpoints
> which the graph binding doesn't support.
> 
> Therefore, one typec node is required per the capabilities of the type-c
> port(s) being managed. This also lets us indicate which type-c ports the
> DP controller is wired to. For example, if DP was connected to ports 0
> and 2, while port 1 was connected to another DP controller we wouldn't
> be able to implement that without having some other DT property to
> indicate which output ports are connected to the DP endpoint.

Based on our disccusions at LPC, here are several DT examples that seem
sensible to implement this case and several related cases from other
ChromeBooks.

typec {
	compatible = "google,cros-ec-typec";

	port {
		typec_dp_in: endpoint {
			remote-endpoint = <&usb_1_qmp_phy_out_dp>;
		};
	};

	usb_c0: connector@0 {
		compatible = "usb-c-connector";
		reg = <0>;

		ports {
			port@0 {
				reg = <0>;
				usb_c0_hs_in: endpoint {
					remote-endpoint = <&usb_hub_dfp1_hs>;
				};
			};

			port@1 {
				reg = <1>;
				usb_c0_ss_in: endpoint {
					remote-endpoint = <&usb_hub_dfp1_ss>;
				};
			};
		};
	};

	usb_c1: connector@1 {
		compatible = "usb-c-connector";
		reg = <1>;

		ports {
			port@0 {
				reg = <0>;
				usb_c1_hs_in: endpoint {
					remote-endpoint = <&usb_hub_dfp2_hs>;
				};
			};

			port@1 {
				reg = <1>;
				usb_c1_ss_in: endpoint {
					remote-endpoint = <&usb_hub_dfp2_ss>;
				};
			};
		};
	};
};

&usb_1_qmpphy {
	ports {
		port@0 {
			endpoint@0 {
				data-lanes = <0 1>;
				// this might go to USB-3 hub
			};

			usb_1_qmp_phy_out_dp: endpoint@1 {
				remote-endpoint = <&typec_dp_in>;
				data-lanes = <2 3>;
			};
		}
	};
};

-------

typec {
	connector@0 {
		port@1 {
			endpoint@0 {
				remtoe = <&usb_hub_0>;
			};

			endpoint@1 {
				remote = <&dp_bridge_out_0>;
			};
		};
	};

	connector@1 {
		port@1 {
			endpoint@0 {
				remtoe = <&usb_hub_1>;
			};

			endpoint@1 {
				remote = <&dp_bridge_out_1>;
			};
		};
	};
};

dp_bridge {
	ports {
		port@1 {
			dp_bridge_out_0: endpoint@0 {
				remote = <usb_c0_ss_dp>;
				data-lanes = <0 1>;
			};

			dp_bridge_out_1: endpoint@1 {
				remote = <usb_c1_ss_dp>;
				data-lanes = <2 3>;
			};
		};
	};
};

-------

This one is really tough example, we didn't reach a conclusion here.
If the EC doesn't handle lane remapping, dp_bridge has to get
orientation-switch and mode-switch properties (as in the end it is the
dp_bridge that handles reshuffling of the lanes for the Type-C). Per the
DisplayPort standard the lanes are fixed (e.g. DPCD 101h explicitly
names lane 0, lanes 0-1, lanes 0-1-2-3).

typec {
	connector@0 {
		port@1 {
			endpoint@0 {
				remtoe = <&usb_hub_0>;
			};

			endpoint@1 {
				remote = <&dp_bridge_out_0>;
			};
		};
	};
};

dp_bridge {
	orientation-switch;
	mode-switch;
	ports {
		port@1 {
			dp_bridge_out_0: endpoint {
				remote = <usb_c0_ss_dp>;
				data-lanes = <0 1 2 3>;
			};
		};
	};
};

-------

> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Acked-by: Lee Jones <lee@kernel.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Prashant Malani <pmalani@chromium.org>
> Cc: Tzung-Bi Shih <tzungbi@kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <chrome-platform@lists.linux.dev>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/mfd/google,cros-ec.yaml	  |   7 +-
>  .../bindings/usb/google,cros-ec-typec.yaml    | 229 ++++++++++++++++++
>  2 files changed, 233 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index c991626dc22b..bbe28047d0c0 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -98,9 +98,6 @@ properties:
>  
>    gpio-controller: true
>  
> -  typec:
> -    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> -
>    ec-pwm:
>      $ref: /schemas/pwm/google,cros-ec-pwm.yaml#
>      deprecated: true
> @@ -166,6 +163,10 @@ patternProperties:
>      type: object
>      $ref: /schemas/extcon/extcon-usbc-cros-ec.yaml#
>  
> +  "^typec(-[0-9])*$":
> +    type: object
> +    $ref: /schemas/usb/google,cros-ec-typec.yaml#
> +
>  required:
>    - compatible
>  
> diff --git a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> index 365523a63179..235b86da3cdd 100644
> --- a/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> +++ b/Documentation/devicetree/bindings/usb/google,cros-ec-typec.yaml
> @@ -26,6 +26,106 @@ properties:
>    '#size-cells':
>      const: 0
>  
> +  mux-gpios:
> +    description: GPIOs indicating which way the DP mux is steered
> +    maxItems: 1
> +
> +  no-hpd:
> +    description: Indicates this endpoint doesn't signal HPD for DisplayPort
> +    type: boolean
> +
> +  mode-switch:
> +    $ref: usb-switch.yaml#properties/mode-switch
> +
> +  orientation-switch:
> +    $ref: usb-switch.yaml#properties/orientation-switch
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +	$ref: /schemas/graph.yaml#/$defs/port-base
> +	unevaluatedProperties: false
> +	description: Output ports for combined DP and USB SS data
> +	patternProperties:
> +	  "^endpoint@([0-8])$":
> +	    $ref: usb-switch.yaml#/$defs/usbc-out-endpoint
> +	    unevaluatedProperties: false
> +
> +	anyOf:
> +	  - required:
> +	      - endpoint@0
> +	  - required:
> +	      - endpoint@1
> +	  - required:
> +	      - endpoint@2
> +	  - required:
> +	      - endpoint@3
> +	  - required:
> +	      - endpoint@4
> +	  - required:
> +	      - endpoint@5
> +	  - required:
> +	      - endpoint@6
> +	  - required:
> +	      - endpoint@7
> +	  - required:
> +	      - endpoint@8
> +
> +      port@1:
> +	$ref: /schemas/graph.yaml#/$defs/port-base
> +	unevaluatedProperties: false
> +	description:
> +	  Input port to receive USB SuperSpeed (SS) data
> +	patternProperties:
> +	  "^endpoint@([0-8])$":
> +	    $ref: usb-switch.yaml#/$defs/usbc-in-endpoint
> +	    unevaluatedProperties: false
> +
> +	anyOf:
> +	  - required:
> +	      - endpoint@0
> +	  - required:
> +	      - endpoint@1
> +	  - required:
> +	      - endpoint@2
> +	  - required:
> +	      - endpoint@3
> +	  - required:
> +	      - endpoint@4
> +	  - required:
> +	      - endpoint@5
> +	  - required:
> +	      - endpoint@6
> +	  - required:
> +	      - endpoint@7
> +	  - required:
> +	      - endpoint@8
> +
> +      port@2:
> +	$ref: /schemas/graph.yaml#/$defs/port-base
> +	description:
> +	  Input port to receive DisplayPort (DP) data
> +	unevaluatedProperties: false
> +
> +	properties:
> +	  endpoint:
> +	    $ref: usb-switch.yaml#/$defs/dp-endpoint
> +	    unevaluatedProperties: false
> +
> +	required:
> +	  - endpoint
> +
> +    required:
> +      - port@0
> +
> +    anyOf:
> +      - required:
> +	  - port@1
> +      - required:
> +	  - port@2
> +
>  patternProperties:
>    '^connector@[0-9a-f]+$':
>      $ref: /schemas/connector/usb-connector.yaml#
> @@ -35,6 +135,40 @@ patternProperties:
>  required:
>    - compatible
>  
> +allOf:
> +  - if:
> +      required:
> +	- no-hpd
> +    then:
> +      properties:
> +	ports:
> +	  required:
> +	    - port@2
> +  - if:
> +      required:
> +	- mux-gpios
> +    then:
> +      properties:
> +	ports:
> +	  required:
> +	    - port@2
> +  - if:
> +      required:
> +	- orientation-switch
> +    then:
> +      properties:
> +	ports:
> +	  required:
> +	    - port@2
> +  - if:
> +      required:
> +	- mode-switch
> +    then:
> +      properties:
> +	ports:
> +	  required:
> +	    - port@2
> +
>  additionalProperties: false
>  
>  examples:
> @@ -50,6 +184,8 @@ examples:
>  
>	  typec {
>	    compatible = "google,cros-ec-typec";
> +	  orientation-switch;
> +	  mode-switch;
>  
>	    #address-cells = <1>;
>	    #size-cells = <0>;
> @@ -60,6 +196,99 @@ examples:
>	      power-role = "dual";
>	      data-role = "dual";
>	      try-power-role = "source";
> +
> +	    ports {
> +	      #address-cells = <1>;
> +	      #size-cells = <0>;
> +
> +	      port@0 {
> +		reg = <0>;
> +		usb_c0_hs: endpoint {
> +		  remote-endpoint = <&usb_hub_dfp3_hs>;
> +		};
> +	      };
> +
> +	      port@1 {
> +		reg = <1>;
> +		usb_c0_ss: endpoint {
> +		  remote-endpoint = <&cros_typec_c0_ss>;
> +		};
> +	      };
> +	    };
> +	  };
> +
> +	  connector@1 {
> +	    compatible = "usb-c-connector";
> +	    reg = <1>;
> +	    power-role = "dual";
> +	    data-role = "dual";
> +	    try-power-role = "source";
> +
> +	    ports {
> +	      #address-cells = <1>;
> +	      #size-cells = <0>;
> +
> +	      port@0 {
> +		reg = <0>;
> +		usb_c1_hs: endpoint {
> +		  remote-endpoint = <&usb_hub_dfp2_hs>;
> +		};
> +	      };
> +
> +	      port@1 {
> +		reg = <1>;
> +		usb_c1_ss: endpoint {
> +		  remote-endpoint = <&cros_typec_c1_ss>;
> +		};
> +	      };
> +	    };
> +	  };
> +
> +	  ports {
> +	    #address-cells = <1>;
> +	    #size-cells = <0>;
> +
> +	    port@0 {
> +	      reg = <0>;
> +	      #address-cells = <1>;
> +	      #size-cells = <0>;
> +
> +	      cros_typec_c0_ss: endpoint@0 {
> +		reg = <0>;
> +		remote-endpoint = <&usb_c0_ss>;
> +		data-lanes = <0 1 2 3>;
> +	      };
> +
> +	      cros_typec_c1_ss: endpoint@1 {
> +		reg = <1>;
> +		remote-endpoint = <&usb_c1_ss>;
> +		data-lanes = <2 3 0 1>;
> +	      };
> +	    };
> +
> +	    port@1 {
> +	      reg = <1>;
> +	      #address-cells = <1>;
> +	      #size-cells = <0>;
> +
> +	      usb_in_0: endpoint@0 {
> +		reg = <0>;
> +		remote-endpoint = <&usb_ss_0_out>;
> +	      };
> +
> +	      usb_in_1: endpoint@1 {
> +		reg = <1>;
> +		remote-endpoint = <&usb_ss_1_out>;
> +	      };
> +	    };
> +
> +	    port@2 {
> +	      reg = <2>;
> +	      dp_in: endpoint {
> +		remote-endpoint = <&dp_phy>;
> +		data-lanes = <0 1>;
> +	      };
> +	    };
>	    };
>	  };
>	};
> -- 
> https://chromeos.dev
> 

-- 
With best wishes
Dmitry

