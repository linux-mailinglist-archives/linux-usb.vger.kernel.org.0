Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4A41BA061
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2020 11:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgD0Ju0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Apr 2020 05:50:26 -0400
Received: from mga12.intel.com ([192.55.52.136]:54132 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726621AbgD0JuZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Apr 2020 05:50:25 -0400
IronPort-SDR: EK/AoY2fFaQHQksLolAuxrhEk58+OlXr5qtP5PCVUXRaoRLXb3Be7EVdrN4iaHFeU+OHYQnGpK
 3OwqSn3k/64A==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2020 02:50:21 -0700
IronPort-SDR: wEOehIJDxSWKvu8i1XId2cF6cVWfhWsSxZS9vU9kcG2xEy0+JjhdEpRKh664oOazV+2CNakUY/
 Jj5D1gDblhxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; 
   d="gz'50?scan'50,208,50";a="458787134"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2020 02:50:18 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jT0P4-00008c-7U; Mon, 27 Apr 2020 17:50:18 +0800
Date:   Mon, 27 Apr 2020 17:49:21 +0800
From:   kbuild test robot <lkp@intel.com>
To:     "K V, Abhilash" <abhilash.k.v@intel.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-testing 32/33] drivers/usb/typec/ucsi/ucsi.c:890:12: error:
 conflicting types for 'ucsi_register_port'
Message-ID: <202004271705.P1ODtjR0%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   f6402eb4a2b3192bdf23fa39ef8e85fd3691cca9
commit: 992a60ed0d5e312ce9a485c9e12097ac82ae4b3e [32/33] usb: typec: ucsi: register with power_supply class
config: riscv-randconfig-a001-20200427 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 992a60ed0d5e312ce9a485c9e12097ac82ae4b3e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/ucsi.c:890:12: error: conflicting types for 'ucsi_register_port'
     890 | static int ucsi_register_port(struct ucsi *ucsi, int index)
         |            ^~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/typec/ucsi/ucsi.c:17:
   drivers/usb/typec/ucsi/ucsi.h:344:19: note: previous definition of 'ucsi_register_port' was here
     344 | static inline int ucsi_register_port(struct ucsi_connector *con) { return 0; }
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/usb/typec/ucsi/ucsi.c: In function 'ucsi_register_port':
>> drivers/usb/typec/ucsi/ucsi.c:939:8: error: implicit declaration of function 'ucsi_register_port_psy'; did you mean 'ucsi_unregister_port_psy'? [-Werror=implicit-function-declaration]
     939 |  ret = ucsi_register_port_psy(con);
         |        ^~~~~~~~~~~~~~~~~~~~~~
         |        ucsi_unregister_port_psy
   cc1: some warnings being treated as errors

vim +/ucsi_register_port +890 drivers/usb/typec/ucsi/ucsi.c

c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  889  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16 @890  static int ucsi_register_port(struct ucsi *ucsi, int index)
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  891  {
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  892  	struct ucsi_connector *con = &ucsi->connector[index];
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  893  	struct typec_capability *cap = &con->typec_cap;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  894  	enum typec_accessory *accessory = cap->accessory;
470ce43a1a8101 Heikki Krogerus 2019-11-04  895  	u64 command;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  896  	int ret;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  897  
bdc62f2bae8fb0 Heikki Krogerus 2019-11-04  898  	INIT_WORK(&con->work, ucsi_handle_connector_change);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  899  	init_completion(&con->complete);
ad74b8649beaf1 Heikki Krogerus 2019-04-23  900  	mutex_init(&con->lock);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  901  	con->num = index + 1;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  902  	con->ucsi = ucsi;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  903  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  904  	/* Get connector capability */
470ce43a1a8101 Heikki Krogerus 2019-11-04  905  	command = UCSI_GET_CONNECTOR_CAPABILITY;
470ce43a1a8101 Heikki Krogerus 2019-11-04  906  	command |= UCSI_CONNECTOR_NUMBER(con->num);
470ce43a1a8101 Heikki Krogerus 2019-11-04  907  	ret = ucsi_run_command(ucsi, command, &con->cap, sizeof(con->cap));
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  908  	if (ret < 0)
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  909  		return ret;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  910  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  911  	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DRP)
ceeb162500c348 Heikki Krogerus 2018-03-20  912  		cap->data = TYPEC_PORT_DRD;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  913  	else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DFP)
ceeb162500c348 Heikki Krogerus 2018-03-20  914  		cap->data = TYPEC_PORT_DFP;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  915  	else if (con->cap.op_mode & UCSI_CONCAP_OPMODE_UFP)
ceeb162500c348 Heikki Krogerus 2018-03-20  916  		cap->data = TYPEC_PORT_UFP;
ceeb162500c348 Heikki Krogerus 2018-03-20  917  
3cf657f07918bc Heikki Krogerus 2019-11-04  918  	if ((con->cap.flags & UCSI_CONCAP_FLAG_PROVIDER) &&
3cf657f07918bc Heikki Krogerus 2019-11-04  919  	    (con->cap.flags & UCSI_CONCAP_FLAG_CONSUMER))
ceeb162500c348 Heikki Krogerus 2018-03-20  920  		cap->type = TYPEC_PORT_DRP;
3cf657f07918bc Heikki Krogerus 2019-11-04  921  	else if (con->cap.flags & UCSI_CONCAP_FLAG_PROVIDER)
ceeb162500c348 Heikki Krogerus 2018-03-20  922  		cap->type = TYPEC_PORT_SRC;
3cf657f07918bc Heikki Krogerus 2019-11-04  923  	else if (con->cap.flags & UCSI_CONCAP_FLAG_CONSUMER)
ceeb162500c348 Heikki Krogerus 2018-03-20  924  		cap->type = TYPEC_PORT_SNK;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  925  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  926  	cap->revision = ucsi->cap.typec_version;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  927  	cap->pd_revision = ucsi->cap.pd_version;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  928  	cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  929  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  930  	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY)
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  931  		*accessory++ = TYPEC_ACCESSORY_AUDIO;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  932  	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_DEBUG_ACCESSORY)
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  933  		*accessory = TYPEC_ACCESSORY_DEBUG;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  934  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  935  	cap->fwnode = ucsi_find_fwnode(con);
6df475f804e628 Heikki Krogerus 2019-11-04  936  	cap->driver_data = con;
6df475f804e628 Heikki Krogerus 2019-11-04  937  	cap->ops = &ucsi_ops;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  938  
992a60ed0d5e31 K V, Abhilash   2020-04-23 @939  	ret = ucsi_register_port_psy(con);
992a60ed0d5e31 K V, Abhilash   2020-04-23  940  	if (ret)
992a60ed0d5e31 K V, Abhilash   2020-04-23  941  		return ret;
992a60ed0d5e31 K V, Abhilash   2020-04-23  942  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  943  	/* Register the connector */
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  944  	con->port = typec_register_port(ucsi->dev, cap);
cf6e06cddf2972 Heikki Krogerus 2018-03-02  945  	if (IS_ERR(con->port))
cf6e06cddf2972 Heikki Krogerus 2018-03-02  946  		return PTR_ERR(con->port);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  947  
ad74b8649beaf1 Heikki Krogerus 2019-04-23  948  	/* Alternate modes */
ad74b8649beaf1 Heikki Krogerus 2019-04-23  949  	ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_CON);
ad74b8649beaf1 Heikki Krogerus 2019-04-23  950  	if (ret)
ad74b8649beaf1 Heikki Krogerus 2019-04-23  951  		dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
ad74b8649beaf1 Heikki Krogerus 2019-04-23  952  			con->num);
ad74b8649beaf1 Heikki Krogerus 2019-04-23  953  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  954  	/* Get the status */
470ce43a1a8101 Heikki Krogerus 2019-11-04  955  	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
470ce43a1a8101 Heikki Krogerus 2019-11-04  956  	ret = ucsi_run_command(ucsi, command, &con->status,
470ce43a1a8101 Heikki Krogerus 2019-11-04  957  			       sizeof(con->status));
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  958  	if (ret < 0) {
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  959  		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  960  		return 0;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  961  	}
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  962  
3cf657f07918bc Heikki Krogerus 2019-11-04  963  	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  964  	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
91813ef8da12fa Mayank Rana     2020-04-23  965  	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
91813ef8da12fa Mayank Rana     2020-04-23  966  	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  967  		typec_set_data_role(con->port, TYPEC_HOST);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  968  		break;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  969  	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  970  		typec_set_data_role(con->port, TYPEC_DEVICE);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  971  		break;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  972  	default:
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  973  		break;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  974  	}
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  975  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  976  	/* Check if there is already something connected */
3cf657f07918bc Heikki Krogerus 2019-11-04  977  	if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
3cf657f07918bc Heikki Krogerus 2019-11-04  978  		typec_set_pwr_role(con->port,
3cf657f07918bc Heikki Krogerus 2019-11-04  979  				  !!(con->status.flags & UCSI_CONSTAT_PWR_DIR));
3cf657f07918bc Heikki Krogerus 2019-11-04  980  		ucsi_pwr_opmode_change(con);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  981  		ucsi_register_partner(con);
3cf657f07918bc Heikki Krogerus 2019-11-04  982  	}
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  983  
ad74b8649beaf1 Heikki Krogerus 2019-04-23  984  	if (con->partner) {
ad74b8649beaf1 Heikki Krogerus 2019-04-23  985  		ret = ucsi_register_altmodes(con, UCSI_RECIPIENT_SOP);
ad74b8649beaf1 Heikki Krogerus 2019-04-23  986  		if (ret)
ad74b8649beaf1 Heikki Krogerus 2019-04-23  987  			dev_err(ucsi->dev,
ad74b8649beaf1 Heikki Krogerus 2019-04-23  988  				"con%d: failed to register alternate modes\n",
ad74b8649beaf1 Heikki Krogerus 2019-04-23  989  				con->num);
ad74b8649beaf1 Heikki Krogerus 2019-04-23  990  		else
ad74b8649beaf1 Heikki Krogerus 2019-04-23  991  			ucsi_altmode_update_active(con);
ad74b8649beaf1 Heikki Krogerus 2019-04-23  992  	}
ad74b8649beaf1 Heikki Krogerus 2019-04-23  993  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  994  	trace_ucsi_register_port(con->num, &con->status);
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  995  
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  996  	return 0;
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  997  }
c1b0bc2dabfa88 Heikki Krogerus 2017-06-16  998  

:::::: The code at line 890 was first introduced by commit
:::::: c1b0bc2dabfa884dea49c02adaf3cd6b52b33d2f usb: typec: Add support for UCSI interface

:::::: TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--k+w/mQv8wyuph6w0
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--k+w/mQv8wyuph6w0--
