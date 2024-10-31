Return-Path: <linux-usb+bounces-16918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5349B85AC
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 22:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7731C21B20
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 21:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A019E1E231A;
	Thu, 31 Oct 2024 21:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PdFZoIg7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0A41CC8B7
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730411139; cv=none; b=WPgsg7SkTSHYtdPuQ5fypn5DmI/S8k6cG+JjG291SyXwX2GzSsiPaR5Oj69LVT/Ch6pIaFHc4Cs+K0AHg9YLIW7FXobDx00fBF1iWEWDc3zKXFL4CYDbecynQ8cF1GGoI7c+X3S/BpTaWjIufbFmVTeTRSyrrmSUMj8VE+RGJZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730411139; c=relaxed/simple;
	bh=ciHoUTCfQn96Fsy69IQsg/6dBTePsL6x11rbHQqz/4k=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Muzj9N2tKrGFPzfGtHc7u1mMb01pOKuWXkOcofSX1fIJ0JlgcctfDvoG5IHriyvPWsg6yMTHXnBKw883CS9zCXqQTKFjJfVd9nO/n5h2b1kEj14l1ltdYBumU7LF2cXgrWyE2Tpixd7sSiA6PxSf41MrF2bwd4yumHmYUqqwRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PdFZoIg7; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-46090640f0cso11438711cf.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730411131; x=1731015931; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vd0uxDEeaftjkHWrYoua47FCzZJacUfUVVqlfHkArdc=;
        b=PdFZoIg7zM5GHaWh+gjsyeyIt5+O6jZTcxtPFiyZ4n3ws/al+0UUOa7b2JV2Qz8zTQ
         HIrAIedOvcm+FVPh/OJJ5xYTgJo1Akna86vnl7j9ILId0D2ynNI7Zui3V0HV4WTLK+5N
         kMRtn60kxrQxrrOBfWljXYBgedTZKZPcXJQp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730411131; x=1731015931;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd0uxDEeaftjkHWrYoua47FCzZJacUfUVVqlfHkArdc=;
        b=MLUojJpIPZR6bTJUP859o32PGf61uvxr4vm35r0w+hUkt8HakntjMUCkGnJnS+W1Vc
         Nko5OF6K66cDekVaTAexnRpCqQX7u99mdMqN9H1Pd+ehRJeTSAWX4xdRjmAWQuGAn9/D
         rzdu3ro3ehBdDRxii2N8+AA5Zu5W2IlfdJvNUx2V2PTk7knZNi9gu8CI/jhmRPGAZnsO
         4D6jDG99790T0FUTRFs3I3cE6dROG4+kEB50ENiS/weHeGuMmxjbIj9TH64CcWSSimxK
         OOAyq6vY34R/fYuEe518THURgl2DBA2asEcwjm3savuls8SimN5DN5XJpwLWEQTwgAJ7
         stRw==
X-Forwarded-Encrypted: i=1; AJvYcCWdmaVQ5SFakBM2it/MVKwjEXCMiUCh8mCUuBNDyZcgwKD+owv+wFToNYGkGCgVUd0YbVyieeCgGek=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlS6jzLb57fVYvxep7RaXO8FEkWzdF91HKDvIMDdSzjkfydzEA
	a4+c09OdBrW54HO0NnDRp5zOfDbdu/R36ngIK2NuLb44YKogLceSMj+r/ILOXpyYFgPBuCnczcK
	HUs6gi5wXshTPI8DZi/ltwFvuALvLxkhWwwNr
X-Google-Smtp-Source: AGHT+IF2epSolEZWlB0rKThO0M98MsP93AxJMc2spWQjDd4hGI6e9DJLTbXBpwJik/G1gszD/XwbU7/ACO4jw7Dy8E0=
X-Received: by 2002:a05:622a:64a:b0:460:a928:6966 with SMTP id
 d75a77b69052e-462b875350fmr12395661cf.42.1730411130973; Thu, 31 Oct 2024
 14:45:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 31 Oct 2024 14:45:30 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
References: <20240901040658.157425-1-swboyd@chromium.org> <20240901040658.157425-16-swboyd@chromium.org>
 <phdcjgqqpjpruxp7v2mw446q73xr3eg4wfgfbjw5tasgr2pgg2@77swbk47b2tg>
 <CAE-0n514QMaQC2yjKP8bZqyfbv6B3AQm=+NJ87vxo6NdYiL03A@mail.gmail.com>
 <lf7y7wpuca6kzqcglgs5d443iusf7xjocum4adi7t3npfavccx@zgsp37oyztme>
 <CAE-0n53-KmOS3zXmJPvOOZ7xxkek9-S=oBExgaY0PDnt_HjdNw@mail.gmail.com> <yk3xidaisbd56yndaucax7otijjauqmm7lqm6q4q633kdawlqo@qaq27lwxmvwd>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 31 Oct 2024 14:45:29 -0700
Message-ID: <CAE-0n501j+8bMnMKabFyZjn+MLUy3Z68Hiv1PsfW0APy5ggN8g@mail.gmail.com>
Subject: Re: [PATCH v4 15/18] dt-bindings: usb: Add ports to
 google,cros-ec-typec for DP altmode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, devicetree@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Pin-yen Lin <treapking@chromium.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Benson Leung <bleung@chromium.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lee Jones <lee@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Prashant Malani <pmalani@chromium.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ivan Orlov <ivan.orlov0322@gmail.com>, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Dmitry Baryshkov (2024-10-31 11:42:36)
> On Tue, Oct 29, 2024 at 01:15:51PM -0700, Stephen Boyd wrote:
> > At this point we need to tell the DP bridge, like IT6505, that it's one
> > or the other output endpoints that it should use, but we haven't
> > directly connected the usb-c-connector to the output ports of IT6505
> > because drm_of_find_panel_or_bridge() can't find the parent of the
> > usb-c-connector if we connect the DP bridge to the usb-c-connector
> > graphs. We'll need a way for the bridge to know which output port is
> > connected to a usb-c-connector fwnode. Some sort of API like
>
> I think that the final bridge should be the IT6505. It can save you from
> some troubles, like the inter-bridge lane negotiation. Please remember
> that using lanes 2-3 as primary lanes doesn't seem to fall into the
> standard DisplayPort usage. It is documented by USB-C and only because
> of the orientation switching.

If the final bridge is IT6505 then drm_of_find_panel_or_bridge() isn't
called and I think we're OK. But then we have to traverse the
remote-endpoint of the usb-c-connector to IT6505 in displayport.c in the
Corsola case while knowing to look at the parent of the usb-c-connector
node and traversing the remote-endpoint to the QMP phy in the Trogdor
case. The logic in dp_altmode_probe() is like

  if (port@1/endpoint@1 exists in usb-c-connector)
    connector_fwnode = port@1/endpoint@1/remote-endpoint
  else if (cros-ec-typec/port exists)
    connector_fwnode = cros-ec-typec/port@0/endpoint/remote-endpoint
  else
    original stuff

If we have the crazy three usb-c-connector design it can still work
because we'd have something like

  cros-ec-typec {
    port {
      dp_endpoint: endpoint {
        remote-endpoint = <&dp_ml0_ml1>;
      };
    };

    usb-c-connector@0 {
      port@1 {
        endpoint {
          remote-endpoint = <&hub_ss0>;
       };
       // Implicitly dp_ml0_ml1
      };
    };
    usb-c-connector@1 {
      port@1 {
        endpoint@0 {
          remote-endpoint = <&hub_ss1>;
        };
        endpoint@1 {
          remote-endpoint = <&dp_ml2_ml3>;
        };
      };
    };
    usb-c-connector@2 {
      port@1 {
        endpoint {
          remote-endpoint = <&hub_ss2>;
        };
       // Implicitly dp_ml0_ml1
      };
    };
  };

(I like thinking about this 3 connector case because it combines both
Trogdor and Corsola designs so I can talk about both cases at the same
time)

I don't know what happens when we have 4 connectors though, with 2 going
to one pair of lanes and 2 going to the other 2 lanes. Maybe it's better
to always have a DP input port in cros-ec-typec to avoid this problem
and map back to the endpoint explicitly.

  cros-ec-typec {
    port {
      dp_endpoint0: endpoint@0 {
        remote-endpoint = <&dp_ml0_ml1>;
      };
      dp_endpoint1: endpoint@1 {
        remote-endpoint = <&dp_ml2_ml3>;
      };
    };

    usb-c-connector@0 {
      port@1 {
        endpoint@0 {
          remote-endpoint = <&hub_ss0>;
       };
       endpoint@1 {
         remote-endpoint = <&dp_endpoint0>;
       };
      };
    };
    usb-c-connector@1 {
      port@1 {
        endpoint@0 {
          remote-endpoint = <&hub_ss1>;
        };
        endpoint@1 {
          remote-endpoint = <&dp_endpoint1>;
        };
      };
    };
    usb-c-connector@2 {
      port@1 {
        endpoint@0 {
          remote-endpoint = <&hub_ss2>;
        };
        endpoint@1 {
          remote-endpoint = <&dp_endpoint1>;
        };
      };
    };
  };

Or use a displayport property that goes to connector node itself so that
we don't extend the graph binding of the usb-c-connector.

  cros-ec-typec {
    usb-c-connector@0 {
      altmodes {
        displayport {
          connector = <&dp_ml0_ml1>;
        };
      };
      port@1 {
        endpoint@0 {
          remote-endpoint = <&hub_ss0>;
       };
      };
    };
    usb-c-connector@1 {
      altmodes {
        displayport {
          connector = <&dp_ml2_ml3>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint = <&hub_ss1>;
        };
      };
    };
    usb-c-connector@2 {
      altmodes {
        displayport {
          connector = <&dp_ml2_ml3>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint = <&hub_ss2>;
        };
      };
    };
  };

  it6505 {
    ports {
      port@1 {
        dp_ml0_ml1: endpoint@0 {
          remote-endpoint = <??>;
        };
        dp_ml2_ml3: endpoint@1 {
          remote-endpoint = <??>;
        };
      };
    };
  };

The logic could look at a node like usb-c-connector@2, find
altmodes/display node, and look for a 'connector' property that points
at the endpoint of the last bridge. If we don't use the OF graph binding
it makes it easier to point at the same endpoint in the QMP phy or the
IT6505 graph from more than one usb-c-connector. This also makes it very
clear that we intend to pass that fwnode as the 'connector_fwnode' to
oob_hotplug_event().

If we want to actually populate the 'remote-endpoint' property of IT6505
we will need to make a graph in cros-ec-typec.

  cros-ec-typec {
    port {
      dp_endpoint0: endpoint@0 {
        remote-endpoint = <&dp_ml0_ml1>;
      };
      dp_endpoint1: endpoint@1 {
        remote-endpoint = <&dp_ml2_ml3>;
      };
    };
    usb-c-connector@0 {
      altmodes {
        displayport {
          connector = <&dp_endpoint0>;
        };
      };
      port@1 {
        endpoint@0 {
          remote-endpoint = <&hub_ss0>;
       };
      };
    };
    usb-c-connector@1 {
      altmodes {
        displayport {
          connector = <&dp_endpoint1>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint = <&hub_ss1>;
        };
      };
    };
    usb-c-connector@2 {
      altmodes {
        displayport {
          connector = <&dp_endpoint1>;
        };
      };
      port@1 {
        endpoint {
          remote-endpoint = <&hub_ss2>;
        };
      };
    };
  };

  it6505 {
    ports {
      port@1 {
        dp_ml0_ml1: endpoint@0 {
          remote-endpoint = <dp_endpoint0>;
        };
        dp_ml2_ml3: endpoint@1 {
          remote-endpoint = <dp_endpoint1>;
        };
      };
    };
  };

and then the logic in displayport.c will have to check if the
'connector' property points at a graph endpoint, traverse that to the
remote-endpoint, and consider that the connector_fwnode.

>
> Maybe that's just it? Register DP_bridge (or QMP PHY) as
> orientation-switch? Then you don't need any extra API for the lane
> mapping? The cross-ec-typec can provide orientation information and the
> USB-C-aware controller will follow the lane mapping.

I'm not really following but I don't think the DT binding discussed here
prevents that.

>
> >
> >  fwnode_graph_get_endpoint_connected_to_fwnode(bridge_fwnode, usb_c_fwnode)
> >
> > that takes the bridge fwnode and traverses the graph to find the
> > endpoint in that's connected to 'usb_c_fwnode'. That traversal API will
> > need help from the intermediate node, cros-ec-typec, so maybe it is
> > better as a drm_bridge API that uses some new drm_bridge_funcs callback.
> > This way IT6505 can ask the bridge chain which output DP endpoint is
> > actually associated with the connector fwnode it gets from the
> > oob_hotplug_event() callback.
> >
> > Here's the two DT snippets that I've ended up with:
> >
> > typec {
> >         compatible = "google,cros-ec-typec";
> >
> >         ports {
> >                 port@0 {
> >                         reg = <0>;
> >                         typec_dp_in: endpoint {
> >                                  remote-endpoint = <&usb_1_qmp_phy_out_dp>;
> >                         };
> >                 };
> >
> >                 port@1 {
> >                         reg = <1>;
> >                         typec_usb0_in: endpoint@0 {
> >                                  reg = <0>;
> >                                  remote-endpoint = <&usb_hub_dfp1_ss>;
> >                         };
> >                         typec_usb1_in: endpoint@1 {
> >                                  reg = <1>;
> >                                  remote-endpoint = <&usb_hub_dfp2_ss>;
> >                         };
> >                 }
> >
> >                 // This port is not really needed because we know the
> >               // mapping from input ports to usb-c-connectors
> >                 port@2 {
> >                         reg = <2>;
> >                         typec0_out: endpoint@0 {
> >                                  reg = <0>;
> >                                  remote-endpoint = <&usb_c0_ss_in>;
> >                         };
> >                         typec1_out: endpoint@1 {
> >                                  reg = <1>;
> >                                  remote-endpoint = <&usb_c1_ss_in>;
> >                         };
> >                 }
>
> Why do we need these two ports? Can't &usb_hub_dfpN_ss be connected
> directly to the usb_cN_ss_in? I understand that you probably want to
> express the internal structure of the lane switching, but I think that's
> a bit of the overkill. Leaving this to the other commenters / DT
> maintainers.

We don't need port@2 because we know that DP goes there.

>
> >         };
> >
> >         usb_c0: connector@0 {
> >                 compatible = "usb-c-connector";
> >                 reg = <0>;
> >
> >                 ports {
> >                         port@0 {
> >                                 reg = <0>;
> >                                 usb_c0_hs_in: endpoint {
> >                                         remote-endpoint = <&usb_hub_dfp1_hs>;
> >                                 };
> >                         };
> >
> >                         port@1 {
> >                                 reg = <1>;
> >                                 usb_c0_ss_in: endpoint {
> >                                         remote-endpoint = <&typec0_out>;
> >                                 };
> >                         };
> >                 };
> >         };
> >
> >         usb_c1: connector@1 {
> >                 compatible = "usb-c-connector";
> >                 reg = <1>;
> >
> >                 ports {
> >                         port@0 {
> >                                 reg = <0>;
> >                                 usb_c1_hs_in: endpoint {
> >                                         remote-endpoint = <&usb_hub_dfp2_hs>;
> >                                 };
> >                         };
> >
> >                         port@1 {
> >                                 reg = <1>;
> >                                 usb_c1_ss_in: endpoint {
> >                                         remote-endpoint = <&typec1_out>;
> >                                 };
> >                         };
> >                 };
> >         };
> > };
> >
> > &usb_1_qmpphy {
> >         ports {
> >                 port@0 {
> >                         endpoint@0 {
> >                                 data-lanes = <0 1>;
> >                                 // this might go to USB-3 hub
> >                         };
> >
> >                         usb_1_qmp_phy_out_dp: endpoint@1 {
> >                                 remote-endpoint = <&typec_dp_in>;
> >                                 data-lanes = <2 3>;
> >                         };
> >                 }
> >         };
> > };
> >
> > -------
> >
> > typec {
> >         ports {
> >                 port@0 {
> >                         reg = <0>;
> >                         typec_dp0_in: endpoint@0 {
> >                                  reg = <0>;
> >                                  remote-endpoint = <&dp_bridge_out_0>;
> >                         };
> >                         typec_dp1_in: endpoint@1 {
> >                                  reg = <1>;
> >                                  remote-endpoint = <&dp_bridge_out_1>;
> >                         };
> >                 };
> >
> >                 port@1 {
> >                         reg = <1>;
> >                         typec_usb0_in: endpoint@0 {
> >                                  reg = <0>;
> >                                  remote-endpoint = <&usb_hub_0_ss>;
> >                         };
> >                         typec_usb1_in: endpoint@1 {
> >                                  reg = <1>;
> >                                  remote-endpoint = <&usb_hub_1_ss>;
> >                         };
> >                 }
> >         };
> >
> >         connector@0 {
> >                 port@1 {
> >                         endpoint@0 {
> >                                 remote-endpoint = <&usb_hub_0_hs>;
>
> port@1 is for SS lanes, so something is wrong here.

I meant port@0

>
> >                         };
> >                 };
> >         };
> >
> >         connector@1 {
> >                 port@1 {
> >                         endpoint@0 {
> >                                 remote-endpoint = <&usb_hub_1_hs>;
> >                         };
> >                 };
> >         };
> > };
> >
> > dp_bridge {
> >         ports {
> >                 port@1 {
> >                         dp_bridge_out_0: endpoint@0 {
> >                                 remote-endpoint = <&typec_dp0_in>;
> >                                 data-lanes = <0 1>;
> >                         };
> >
> >                         dp_bridge_out_1: endpoint@1 {
> >                                 remote-endpoint = <&typec_dp1_in>;
> >                                 data-lanes = <2 3>;
> >                         };
> >                 };
> >         };
> > };
> >
> > -------
> >
> > I wonder about a case where we may take two lanes and connect them to a
> > usb-c-connector and then take the other two lanes and send them through
> > a mux to two more usb-c-connectors. I think we'll need another property
> > in that case that indicates which input DP endpoints correspond to the
> > usb-c-connector nodes.
> >
> > typec {
> >         ports {
> >                 port@0 {
> >                         reg = <0>;
> >                         typec_dp0_in: endpoint@0 {
> >                                  reg = <0>;
> >                                  remote-endpoint = <&dp_bridge_out_0>;
> >                         };
> >                         typec_dp1_in: endpoint@1 {
> >                                  reg = <1>;
> >                                  remote-endpoint = <&dp_bridge_out_1>;
> >                         };
> >                 };
> >
> >                 port@1 {
> >                         reg = <1>;
> >                         typec_usb0_in: endpoint@0 {
> >                                  reg = <0>;
> >                                  remote-endpoint = <&usb_hub_0_ss>;
> >                         };
> >                         typec_usb1_in: endpoint@1 {
> >                                  reg = <1>;
> >                                  remote-endpoint = <&usb_hub_1_ss>;
> >                         };
> >                         typec_usb2_in: endpoint@2 {
> >                                  reg = <2>;
> >                                  remote-endpoint = <&usb_hub_2_ss>;
> >                         };
> >                 }
> >         };
> >
> >       dp-2-usb-mapping = <0 0>, <1 1>, <1 2>;
>
> dp-to-typec-mapping?

Sure

>
> > };
> >
> > This property would indicate dp endpoint 0 goes to usb-c-connector 0
> > while dp endpoint 1 goes to usb-c-connector 1 and 2. I don't have this
> > hardware but I could see how someone might do this by adding another mux
> > that the EC controls. I don't want to design a binding and have to
> > rework it in the future to handle this new case. I hope adding a new
> > property, or getting more information from the EC firmware, will be
> > sufficient to describe the linkage between the DP endpoint and the
> > connectors managed by the cros-ec-typec device.
>
> Does it change anything from the DP point of view? It is still either
> lanes 0-1 or lanes 2-3? I'd really like to inject the hotplug OOB event
> to the dp_bridge letting it get one of the endpoints as a HPD even
> source.

Nothing changes from the DP point of view. I understand that you want
the bridge to see one of its endpoints as the 'connector_fwnode' passed
to oob_hotplug_event().

>
> > > > Corsola could work with this design, but we'll need to teach
> > > > dp_altmode_probe() to look for the drm_bridge elsewhere besides as the
> > > > parent of the usb-c-connector node. That implies using the 'displayport'
> > > > property in the cros-ec-typec node or teaching dp_altmode_probe() to
> > > > look for the port@1/endpoint@1 remote-endpoint handle in the
> > > > usb-c-connector graph.
> > > >
> > > > Assuming the bindings you've presented here are fine and good and I got
> > > > over the differences between Trogdor and Corsola, then I can make mostly
> > > > everything work with the drm_connector_oob_hotplug_event() signature
> > > > change from above and some tweaks to dp_altmode_probe() to look for
> > > > port@1/endpoint@1 first because that's the "logical" DP input endpoint
> > > > in the usb-c-connector binding's graph. Great! The final roadblock I'm
> > > > at is that HPD doesn't work on Trogdor, so I can't signal HPD through
> > > > the typec framework.
> > >
> > > Hmm, I thought that a normal DP's HPD GPIO works on the trogdor. Was I
> > > misunderstanding it? But then we don't know, which USB-C connector
> > > triggered the HPD...
> >
> > By HPD not working on Trogdor I mean that the EC doesn't tell the kernel
> > about the state of HPD for a usb-c-connector in software. Instead, HPD
> > is signaled directly to the DP controller in hardware via a GPIO. It is
> > as you suspect, we don't know which USB-C connector has HPD unless we
> > read the mux controlled by the EC and combine that with what the DP
> > driver knows about the state of the HPD pin.
>
> I see. So the HPD event gets delivered to the DP controller, but we
> really need some API to read the port? If it's not the
> orientation-switch, of course.

Yes. This is needed to understand what USB type-c connector the DP
signals should go to. In the case of Corsola/IT6505 it's needed to know
which two lanes should be sent if both type-c connectors/ports are
capable of DP altmode. On Corsola, the EC could tell the kernel that
both ports are in DP altmode but the EC is also controlling the AUX
channel mux that decides which usb-c-connector type-c port is actually
displaying DP.

