Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F08A28D0BF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 16:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389046AbgJMO6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 10:58:07 -0400
Received: from mga06.intel.com ([134.134.136.31]:54887 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388986AbgJMO6G (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Oct 2020 10:58:06 -0400
IronPort-SDR: tt1h5Ngimg7wjQBcPVp7GUW/4qpQ25s3X7gzNQaPEh0ycHF/Zv/LPz08eSUIXk/3tXEETrPRqF
 mkAkghr+RKBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="227561317"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="gz'50?scan'50,208,50";a="227561317"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 07:58:03 -0700
IronPort-SDR: uVG0VMyFunyWxjoanFaEm7kJokaV98Exajiek3zmH/CwUDLkQ+NQJFZ83YXB0OKlwUryDNlPap
 p0QM141dIJqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; 
   d="gz'50?scan'50,208,50";a="299624655"
Received: from lkp-server01.sh.intel.com (HELO ca2eb8e9a2ab) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2020 07:58:01 -0700
Received: from kbuild by ca2eb8e9a2ab with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kSLkW-00002b-D5; Tue, 13 Oct 2020 14:58:00 +0000
Date:   Tue, 13 Oct 2020 22:57:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Cc:     kbuild-all@lists.01.org, John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v4 2/3] usb: xhci: Use temporary buffer to consolidate SG
Message-ID: <202010132202.5yQazLeq-lkp@intel.com>
References: <a4cb87733fe1e82a1a3f2b8998add6af7d363fe4.1602592488.git.joglekar@synopsys.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <a4cb87733fe1e82a1a3f2b8998add6af7d363fe4.1602592488.git.joglekar@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on next-20201013]
[cannot apply to balbi-usb/testing/next peter.chen-usb/ci-for-usb-next v5.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tejas-Joglekar/Add-logic-to-consolidate-TRBs-for-Synopsys-xHC/20201013-204605
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: m68k-randconfig-m031-20201013 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9d7453725e3adcd62b021dbf4cbd4f29476e71e4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tejas-Joglekar/Add-logic-to-consolidate-TRBs-for-Synopsys-xHC/20201013-204605
        git checkout 9d7453725e3adcd62b021dbf4cbd4f29476e71e4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci.c: In function 'xhci_map_temp_buffer':
>> drivers/usb/host/xhci.c:1269:19: warning: variable 'xhci' set but not used [-Wunused-but-set-variable]
    1269 |  struct xhci_hcd *xhci;
         |                   ^~~~
>> drivers/usb/host/xhci.c:1266:15: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1266 |  unsigned int len;
         |               ^~~
   drivers/usb/host/xhci.c: In function 'xhci_urb_temp_buffer_required':
>> drivers/usb/host/xhci.c:1305:15: warning: variable 'buf_len' set but not used [-Wunused-but-set-variable]
    1305 |  unsigned int buf_len;
         |               ^~~~~~~
   drivers/usb/host/xhci.c: In function 'xhci_unmap_temp_buf':
   drivers/usb/host/xhci.c:1345:15: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    1345 |  unsigned int len;
         |               ^~~
>> drivers/usb/host/xhci.c:1344:22: warning: variable 'sg' set but not used [-Wunused-but-set-variable]
    1344 |  struct scatterlist *sg;
         |                      ^~

vim +/xhci +1269 drivers/usb/host/xhci.c

  1261	
  1262	static int xhci_map_temp_buffer(struct usb_hcd *hcd, struct urb *urb)
  1263	{
  1264		void *temp;
  1265		int ret = 0;
> 1266		unsigned int len;
  1267		unsigned int buf_len;
  1268		enum dma_data_direction dir;
> 1269		struct xhci_hcd *xhci;
  1270	
  1271		xhci = hcd_to_xhci(hcd);
  1272		dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
  1273		buf_len = urb->transfer_buffer_length;
  1274	
  1275		temp = kzalloc_node(buf_len, GFP_ATOMIC,
  1276				    dev_to_node(hcd->self.sysdev));
  1277	
  1278		if (usb_urb_dir_out(urb))
  1279			len = sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
  1280						 temp, buf_len, 0);
  1281	
  1282		urb->transfer_buffer = temp;
  1283		urb->transfer_dma = dma_map_single(hcd->self.sysdev,
  1284						   urb->transfer_buffer,
  1285						   urb->transfer_buffer_length,
  1286						   dir);
  1287	
  1288		if (dma_mapping_error(hcd->self.sysdev,
  1289				      urb->transfer_dma)) {
  1290			ret = -EAGAIN;
  1291			kfree(temp);
  1292		} else {
  1293			urb->transfer_flags |= URB_DMA_MAP_SINGLE;
  1294		}
  1295	
  1296		return ret;
  1297	}
  1298	
  1299	static bool xhci_urb_temp_buffer_required(struct usb_hcd *hcd,
  1300						  struct urb *urb)
  1301	{
  1302		bool ret = false;
  1303		unsigned int i;
  1304		unsigned int len = 0;
> 1305		unsigned int buf_len;
  1306		unsigned int trb_size;
  1307		unsigned int max_pkt;
  1308		struct scatterlist *sg;
  1309		struct scatterlist *tail_sg;
  1310	
  1311		sg = urb->sg;
  1312		tail_sg = urb->sg;
  1313		buf_len = urb->transfer_buffer_length;
  1314		max_pkt = usb_endpoint_maxp(&urb->ep->desc);
  1315	
  1316		if (!urb->num_sgs)
  1317			return ret;
  1318	
  1319		if (urb->dev->speed >= USB_SPEED_SUPER)
  1320			trb_size = TRB_CACHE_SIZE_SS;
  1321		else
  1322			trb_size = TRB_CACHE_SIZE_HS;
  1323	
  1324		if (urb->transfer_buffer_length != 0 &&
  1325		    !(urb->transfer_flags & URB_NO_TRANSFER_DMA_MAP)) {
  1326			for_each_sg(urb->sg, sg, urb->num_sgs, i) {
  1327				len = len + sg->length;
  1328				if (i > trb_size - 2) {
  1329					len = len - tail_sg->length;
  1330					if (len < max_pkt) {
  1331						ret = true;
  1332						break;
  1333					}
  1334	
  1335					tail_sg = sg_next(tail_sg);
  1336				}
  1337			}
  1338		}
  1339		return ret;
  1340	}
  1341	
  1342	static void xhci_unmap_temp_buf(struct usb_hcd *hcd, struct urb *urb)
  1343	{
> 1344		struct scatterlist *sg;
  1345		unsigned int len;
  1346		unsigned int buf_len;
  1347		enum dma_data_direction dir;
  1348	
  1349		dir = usb_urb_dir_in(urb) ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
  1350	
  1351		sg = urb->sg;
  1352		buf_len = urb->transfer_buffer_length;
  1353	
  1354		if (IS_ENABLED(CONFIG_HAS_DMA) &&
  1355		    (urb->transfer_flags & URB_DMA_MAP_SINGLE))
  1356			dma_unmap_single(hcd->self.sysdev,
  1357					 urb->transfer_dma,
  1358					 urb->transfer_buffer_length,
  1359					 dir);
  1360	
  1361		if (usb_urb_dir_in(urb))
  1362			len = sg_pcopy_from_buffer(urb->sg, urb->num_sgs,
  1363						   urb->transfer_buffer,
  1364						   buf_len,
  1365						   0);
  1366	
  1367		urb->transfer_flags &= ~URB_DMA_MAP_SINGLE;
  1368		kfree(urb->transfer_buffer);
  1369		urb->transfer_buffer = NULL;
  1370	}
  1371	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--8t9RHnE3ZwKMSgU+
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--8t9RHnE3ZwKMSgU+--
