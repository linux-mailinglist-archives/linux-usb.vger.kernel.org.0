Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81D2543B94
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 20:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiFHSfx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 14:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFHSfw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 14:35:52 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0EBDE96F0;
        Wed,  8 Jun 2022 11:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654713350; x=1686249350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DqUiRXlTjJeKVR62BqB5dFoUTGYJ9vm4Fy2jswQl65M=;
  b=cQU8m4oZygBxGQGJpNmSRR9W1xuYTx7H6WrsrfNYY/3oCfb7pvU28ado
   NBIG0VqsIwZJUdxWISoJT9AufF9nvzVBQcEYPh64xMH5viAaUUuic5rNV
   JEk3dkOR9rri/lZs/iiPqSI72gvN86jdEjkxFpaB7gpqsHYnqF9x9tVkc
   ShZjspID/xgnqXucdC56OUznNAUMTWwjFXeDkBtmLE12+mKkcYH5TdP6o
   S1AP+sOpdePCJJYUQPjzskHzqYAl8gSOGs69EcMy9P56pFbFq8c/ePLHI
   iXFhJ4DU4iiWFC2aVlm0f8wiZ5vuO3yT4LFYg5Ts/NMfEaqZ0V8AEPKkf
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="363330277"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="363330277"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 11:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="683490966"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2022 11:35:43 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1nz0Wt-000Eu1-5U;
        Wed, 08 Jun 2022 18:35:43 +0000
Date:   Thu, 9 Jun 2022 02:35:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Prashant Malani <pmalani@chromium.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        heikki.krogerus@linux.intel.com,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Tzung-Bi Shih <tzungbi@google.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado 
        <nfraprado@collabora.com>, Jonas Karlman <jonas@kwiboo.se>,
        swboyd@chromium.org, Pin-Yen Lin <treapking@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Xin Ji <xji@analogixsemi.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Foss <robert.foss@linaro.org>,
        Prashant Malani <pmalani@chromium.org>,
        =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH 6/7] drm/bridge: anx7625: Register Type-C mode switches
Message-ID: <202206090245.ZHrBQ2To-lkp@intel.com>
References: <20220607190131.1647511-7-pmalani@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607190131.1647511-7-pmalani@chromium.org>
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Prashant,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on usb/usb-testing v5.19-rc1 next-20220608]
[cannot apply to balbi-usb/testing/next peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-buildonly-randconfig-r012-20220608 (https://download.01.org/0day-ci/archive/20220609/202206090245.ZHrBQ2To-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2ac4609c73d7bb4d1a585dae84559967ced3bad6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Prashant-Malani/usb-typec-Introduce-typec-switch-binding/20220608-042545
        git checkout 2ac4609c73d7bb4d1a585dae84559967ced3bad6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/analogix/anx7625.c:18:
>> include/linux/usb/typec_mux.h:83:19: warning: no previous prototype for function 'fwnode_typec_mux_get' [-Wmissing-prototypes]
   struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
                     ^
   include/linux/usb/typec_mux.h:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct typec_mux *fwnode_typec_mux_get(struct fwnode_handle *fwnode,
   ^
   static 
>> include/linux/usb/typec_mux.h:89:6: warning: no previous prototype for function 'typec_mux_put' [-Wmissing-prototypes]
   void typec_mux_put(struct typec_mux *mux) {}
        ^
   include/linux/usb/typec_mux.h:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void typec_mux_put(struct typec_mux *mux) {}
   ^
   static 
>> include/linux/usb/typec_mux.h:91:5: warning: no previous prototype for function 'typec_mux_set' [-Wmissing-prototypes]
   int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
       ^
   include/linux/usb/typec_mux.h:91:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
   ^
   static 
>> include/linux/usb/typec_mux.h:103:1: warning: no previous prototype for function 'typec_mux_register' [-Wmissing-prototypes]
   typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
   ^
   include/linux/usb/typec_mux.h:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct typec_mux *
   ^
   static 
>> include/linux/usb/typec_mux.h:107:6: warning: no previous prototype for function 'typec_mux_unregister' [-Wmissing-prototypes]
   void typec_mux_unregister(struct typec_mux *mux) {}
        ^
   include/linux/usb/typec_mux.h:107:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void typec_mux_unregister(struct typec_mux *mux) {}
   ^
   static 
>> include/linux/usb/typec_mux.h:109:6: warning: no previous prototype for function 'typec_mux_set_drvdata' [-Wmissing-prototypes]
   void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
        ^
   include/linux/usb/typec_mux.h:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void typec_mux_set_drvdata(struct typec_mux *mux, void *data) {}
   ^
   static 
>> include/linux/usb/typec_mux.h:110:7: warning: no previous prototype for function 'typec_mux_get_drvdata' [-Wmissing-prototypes]
   void *typec_mux_get_drvdata(struct typec_mux *mux)
         ^
   include/linux/usb/typec_mux.h:110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *typec_mux_get_drvdata(struct typec_mux *mux)
   ^
   static 
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2617:23: error: incompatible pointer types assigning to 'struct typec_mux_dev *' from 'struct typec_mux *' [-Werror,-Wincompatible-pointer-types]
           port_data->typec_mux = typec_mux_register(dev, &mux_desc);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/analogix/anx7625.c:2631:24: error: incompatible pointer types passing 'struct typec_mux_dev *' to parameter of type 'struct typec_mux *' [-Werror,-Wincompatible-pointer-types]
                   typec_mux_unregister(ctx->typec_ports[i].typec_mux);
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_mux.h:107:45: note: passing argument to parameter 'mux' here
   void typec_mux_unregister(struct typec_mux *mux) {}
                                               ^
   7 warnings and 2 errors generated.


vim +2617 drivers/gpu/drm/bridge/analogix/anx7625.c

  2590	
  2591	static int anx7625_register_mode_switch(struct device *dev, struct device_node *node,
  2592						struct anx7625_data *ctx)
  2593	{
  2594		struct anx7625_port_data *port_data;
  2595		struct typec_mux_desc mux_desc = {};
  2596		char name[32];
  2597		u32 port_num;
  2598		int ret;
  2599	
  2600		ret = of_property_read_u32(node, "reg", &port_num);
  2601		if (ret)
  2602			return ret;
  2603	
  2604		if (port_num >= ctx->num_typec_switches) {
  2605			dev_err(dev, "Invalid port number specified: %d\n", port_num);
  2606			return -EINVAL;
  2607		}
  2608	
  2609		port_data = &ctx->typec_ports[port_num];
  2610		port_data->ctx = ctx;
  2611		mux_desc.fwnode = &node->fwnode;
  2612		mux_desc.drvdata = port_data;
  2613		snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
  2614		mux_desc.name = name;
  2615		mux_desc.set = anx7625_typec_mux_set;
  2616	
> 2617		port_data->typec_mux = typec_mux_register(dev, &mux_desc);
  2618		if (IS_ERR(port_data->typec_mux)) {
  2619			ret = PTR_ERR(port_data->typec_mux);
  2620			dev_err(dev, "Mode switch register for port %d failed: %d", port_num, ret);
  2621		}
  2622	
  2623		return ret;
  2624	}
  2625	
  2626	static void anx7625_unregister_typec_switches(struct anx7625_data *ctx)
  2627	{
  2628		int i;
  2629	
  2630		for (i = 0; i < ctx->num_typec_switches; i++)
> 2631			typec_mux_unregister(ctx->typec_ports[i].typec_mux);
  2632	}
  2633	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
